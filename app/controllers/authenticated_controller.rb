class AuthenticatedController < ApplicationController
  before_filter :authenticate
  
  protected
  def authenticate
    if current_user.nil?
      warden.authenticate! :cookie
      if warden.authenticated? 
        session[:confirmed] = true
      end
    end
  end
  
  protected

end