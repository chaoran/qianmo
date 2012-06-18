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
    new_user_profile_path(resource)
  end
  
  # Copied from devise. comment out set alert message.
  def require_no_authentication
    assert_is_devise_resource!
    return unless is_navigational_format?
    no_input = devise_mapping.no_input_strategies

    authenticated = if no_input.present?
      args = no_input.dup.push :scope => resource_name
      warden.authenticate?(*args)
    else
      warden.authenticated?(resource_name)
    end

    if authenticated && resource = warden.user(resource_name)
      #flash[:alert] = I18n.t("devise.failure.already_authenticated")
      redirect_to after_sign_in_path_for(resource)
    end
  end
end

