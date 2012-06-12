class ConfirmationsController < Devise::ConfirmationsController
  def new
    super
  end
  
  def create
    self.resource = resource_class.send_confirmation_instructions(resource_params)

    if successfully_sent?(resource)
      respond_to do |format|
        format.js { render :layout => false }
      end
    else
      # report to admin page
    end
  end

  def show
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])

    if resource.errors.empty?
      set_flash_message(:notice, :confirmed, :email => "#{resource.email}") if is_navigational_format?
      sign_in(resource_name, resource)
      redirect_to edit_user_registration_path(resource)
    else
      redirect_to edit_user_registration_path(resource)
    end
  end
  
  protected
  
  # copied form Devise-2.1.0. Added :email interpolation argument to notice message.
  def successfully_sent?(resource)
    notice = if Devise.paranoid
      resource.errors.clear
      :send_paranoid_instructions
    elsif resource.errors.empty?
      :send_instructions
    end

    if notice
      set_flash_message :notice, notice, :email => "#{resource.email}" if is_navigational_format?
      true
    end
  end
end
