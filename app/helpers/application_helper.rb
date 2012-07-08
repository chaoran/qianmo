# encoding: utf-8
module ApplicationHelper
  # This makes form_for helper usable for singular nested resource 
  # It should be reported to Rails community as a bug
  def user_profiles_path (*args)
    user_profile_path(*args)
  end
  
  def icon(name)
    "<i class=\"icon-#{name}\"></i>"
  end
  
  def title(page_title)
    content_for(:title) { page_title }
  end
  
  def message_bar(&block)
    content = capture(&block)
    content_tag(:div, :class => "alert alert-block") do
      '<a class="close" data-dismiss="alert">×</a>'.html_safe + content
    end
  end
  
  def small_edit_button(url, options={})
    options[:class] = ['btn', options[:class]].compact
    link_to(url, options) do 
      "<i class=\"icon-pencil\"></i> #{t :edit}".html_safe
    end
  end
  
  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end
  
  def link_to_with_icon(name, url, icon, options={})
    link_to(url, options) do
      "<i class=\"#{icon}\"></i>&nbsp;#{name}".html_safe
    end 
  end
  
  def my_link_to(*args, &block)
    if block_given?
      options = args.first || {}
      html_options = args.second
      my_link_to(capture(&block), options, html_options)
    else
      name = args[0]
      url = args[1] || {}
      options = args[2] || {}
      
      if (options.has_key?(:tooltip))
        tooltip = options.delete(:tooltip)
        options[:rel] = "tooltip"
        options[:title] = tooltip
      end
      html = link_to(url, options) do
        content = ""
        if (options.has_key?(:icon)) 
          icon = options.delete(:icon)
          content << "<i class=\"#{icon}\""
          if options.has_key?(:"icon-background")
            content << " style=\"background-image:url(" + 
                       options.delete(:"icon-background") + ");\""
          end
          content << "></i>&nbsp;"
        end
        content << "#{name}" if name
        if (options.has_key?(:badge))
          badge = options.delete(:badge)
          content << "<span class=\"badge" 
          if options.has_key?(:"badge-class")
            content << " #{options.delete(:"badge-class")}"
          else
            content << " badge-important"
          end
          content << "\">#{badge}</span>"
        end
        content.html_safe
      end
      html.slice!(" nofollow") if html.include?("tooltip")
      html.html_safe
    end
  end
end
