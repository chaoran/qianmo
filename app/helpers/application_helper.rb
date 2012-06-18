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
end
