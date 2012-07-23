class AccountsController < ApplicationController
  def new
    @account = Account.new
    @account.build_user()
  end
  
  def create
    @account = Account.new(params[:account])
    @account.password_set_at = Time.now
    if @account.save 
      warden.set_user(@account.user)
      @account.send_confirmation_instructions
      redirect_to root_path, :notice => I18n.t(:'confirmations.sent', :email => @account.email).html_safe
    else
      render 'new'
    end
  end
  
  def edit
    @account = current_user.account
  end
  
  # REFACTOR: move this logic into model
  def update 
    @account = current_user.account
    if @account.authenticate(params[:account].delete(:current_password))
      if params[:edit] == "email" # special treatment for email
        @account.send_confirmation_instructions(params[:account][:email])
        flash[:notice] = I18n.t(:"confirmations.sent", 
                                 :email => params[:account][:email]).html_safe
        # do not update current email unless it is not confirmed
        if @account.confirmed? 
          redirect_to edit_account_path
          return
        end
      end 
      if params[:edit] == "password"
        params[:account][:password_set_at] = Time.now
      end
      if @account.update_attributes(params[:account])
        redirect_to edit_account_path
      else
        render 'edit'
      end
    else 
      @account.errors.add(:current_password, I18n.t(:'accounts.wrong_password'))
      render 'edit'
    end
  end
  
  protected
   
  # def after_update_path_for(resource)
  #   edit_user_registration_path(resource)
  # end
  # 
  # def after_sign_up_path_for(resource)
  #   root_path
  # end
  # 
  # # Copied from devise. comment out set alert message.
  # def require_no_authentication
  #   assert_is_devise_resource!
  #   return unless is_navigational_format?
  #   no_input = devise_mapping.no_input_strategies
  # 
  #   authenticated = if no_input.present?
  #     args = no_input.dup.push :scope => resource_name
  #     warden.authenticate?(*args)
  #   else
  #     warden.authenticated?(resource_name)
  #   end
  # 
  #   if authenticated && resource = warden.user(resource_name)
  #     #flash[:alert] = I18n.t("devise.failure.already_authenticated")
  #     redirect_to after_sign_in_path_for(resource)
  #   end
  # end
end

