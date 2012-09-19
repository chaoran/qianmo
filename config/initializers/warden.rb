module Warden::Mixins::Common
  def request
    @request ||= ActionDispatch::Request.new(env)
  end

  # This is called internally by Warden on logout
  def reset_session!
    request.reset_session
  end

  def cookies
    request.cookie_jar
  end
end

Rails.application.config.middleware.use Warden::Manager do |manager|
  manager.default_strategies :cookie, :password
  manager.failure_app = lambda { |env| SessionsController.action(:new).call(env) }
end

Warden::Manager.serialize_into_session do |user|
  user.id
end

Warden::Manager.serialize_from_session do |id|
  User.find_by_id(id)
end

Warden::Strategies.add(:password) do
  def valid?
    params['email'] && params['password']
  end
  
  def authenticate!
    account = Account.find_by_email(params['email'])
    if account && account.authenticate(params['password'])
      success! account.user 
    else
      fail I18n.t("activerecord.session.errors.login_failed")
    end
  end
end

Warden::Strategies.add(:cookie) do 
  def valid?
    @remember_cookie = nil
    remember_cookie.present?
  end
  
  def authenticate!
    account = Account.deserialize(*remember_cookie)
    if account && !account.remember_expired?
      success! account.user
    elsif 
      cookies.delete("remember_token")
      halt!
    end
  end
  
  def remember_cookie
    @remember_cookie ||= cookies.signed["remember_token"]
  end
end

Warden::Manager.after_set_user :except => :fetch do |user, warden, options|
  if warden.request.params[:remember_me] != false && warden.authenticated?
    user.account.remember_me!(warden)
  end
end

Warden::Manager.before_logout do |user, warden, options|
  user.account.forget_me!(warden) 
end