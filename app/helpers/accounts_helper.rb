module AccountsHelper
  def personal_url (username)
    raw("http://#{request.env['HTTP_HOST']}/" + "<em>" + username + "</em>")
  end
end
