class SessionsController < ApplicationController
  # GET /login
  def new
    flash.now.alert = warden.message if warden.message.present?
  end
  
  # POST /login
  def create
    warden.authenticate!
    redirect_to root_url
  end
  
  # GET /logout
  def destroy
    warden.user #this is a bug in warden; https://github.com/hassox/warden/issues/16
    warden.logout 
    redirect_to signup_path, :notice => I18n.t("sessions.logged_out")
  end
end
