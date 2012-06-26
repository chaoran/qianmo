require 'sanitize'
module Trigger
  include Rails.application.routes.url_helpers

  protected
  
  def sanitize_input
    self.text = Sanitize.clean(self.text) # Sanitize input first!!!
  end
  
  def trigger_events
    users = []
    pages = []
    
    self.text.sub!(/@[^\s;]*/) do |m|
      name = m.to_s[1..-1]
      unless name.blank?
        if user = User.find_by_name(name)
          users << user
          replace = "<a href=\"#{user_profile_path(user)}\">" + m + "</a>"
        end
      end
    end
    self.text.sub!(/#[^\s;]*/) do |m|
      title = m.to_s[1..-1]
      unless title.blank?
        if page = Page.find_by_title(title)
          pages << page
          replace = "<a href=\"#{page_path(page)}\">" + m + "</a>"
        end
      end
    end
    
    yield # save record
    
    for user in users
      self.events.create(:receiver => user)
    end
    for page in pages
      self.events.create(:receiver => page)
    end
  end
end