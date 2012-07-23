module AccountsHelper
  def personal_url (username)
    raw("http://#{request.env['HTTP_HOST']}/" + "<em>" + username + "</em>")
  end
  
  def username_introduction
    content_tag :span, :class => 'grey' do
      html = I18n.t(:'accounts.username_introduction1')
      html << "<em>"
      html << "http://#{request.host_with_port}/"
      html << "<strong>"
      html << I18n.t(:'accounts.username')
      html << "</strong></em>"
      html << I18n.t(:'accounts.username_introduction2')
      html.html_safe
    end
  end
  
  def username_display(username)
    content_tag :span, :class => 'grey' do
      html = "http://#{request.host_with_port}/"
      html << "<em>"
      html << "#{username}"
      html << "</em>"
      html.html_safe
    end
  end
end
