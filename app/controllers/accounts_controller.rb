class AccountsController < Devise::RegistrationsController
  def edit
    @edit_field = params[:field]
    super
  end
  
  def update
    @edit_field = params[:field]
    super
  end
  
  protected
   
  def after_update_path_for(resource)
    edit_user_registration_path(resource)
  end
  
  def after_sign_up_path_for(resource)
    edit_user_profile_path(resource)
  end

end

