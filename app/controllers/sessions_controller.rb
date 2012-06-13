class SessionsController < Devise::SessionsController
  before_filter :setup_user_params, :only => :create
  def create
    resource = warden.authenticate!(auth_options)
    #set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource_name, resource)
    respond_with resource, :location => after_sign_in_path_for(resource)
  end
  
  # DELETE /resource/sign_out
  def destroy
    redirect_path = after_sign_out_path_for(resource_name)
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    set_flash_message :notice, :signed_out if signed_out

    # We actually need to hardcode this as Rails default responder doesn't
    # support returning empty response on GET request
    respond_to do |format|
      format.any(*navigational_formats) { redirect_to redirect_path }
      format.all do
        head :no_content
      end
    end
  end
  
  private
  def setup_user_params
    unless params[:user]
      params[:user] = {}
      params[:user][:email] = params[:email]
      params[:user][:password] = params[:password]
      params[:user][:remember_me] = params[:remember_me]
    end
  end
end
