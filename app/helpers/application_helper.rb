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
end
