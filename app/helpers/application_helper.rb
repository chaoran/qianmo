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
end
