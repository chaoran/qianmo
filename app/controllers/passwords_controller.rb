class PasswordsController < Devise::PasswordsController
  def new
    super
  end
  
  def create
    self.resource = resource_class.send_reset_password_instructions(resource_params)

    if successfully_sent?(resource)
      respond_to do |format|
        format.js { render :layout => false }
      end
      #respond_with({}, :location => after_sending_reset_password_instructions_path_for(resource_name))
    else
      #raise "error"
      #render 'create_error', :formats => [:js], :layout => false
      respond_to do |format|
        format.js { render 'create_error', :layout => false }
      end
      #respond_with(resource)
    end
  end
end
