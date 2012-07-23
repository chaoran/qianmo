class ConfirmationsController < AuthenticatedController
  skip_before_filter :authenticate, :only => :show
  
  def create
    @confirmation = current_user.account.confirmation
    if @confirmation
      current_user.account.send_confirmation_instructions
      redirect_to :back, :notice => I18n.t(:"confirmations.sent", 
                                           :email => @confirmation.unconfirmed_email).html_safe
    else
      render "shared/error", :alert => I18n.t(:"should_not_access")
    end
  end

  def show
    if @account = Confirmation.confirm_by_token!(params[:token])
      warden.set_user(@account.user)
      redirect_to root_path, :notice => I18n.t("confirmations.confirmed", 
                                               :email => @account.email).html_safe
    else
      redirect_to signup_path, :error => I18n.t("confirmations.invalid_token")
    end
  end
end
