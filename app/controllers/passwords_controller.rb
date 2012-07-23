class PasswordsController < ApplicationController
  def create
    @account = Account.find_by_email(params[:email])
    if @account
      @account.sent_reset_password_instructions
      flash.now[:notice] = I18n.t(:'passwords.sent', :email => params[:email]).html_safe
    else
      flash.now[:error] = I18n.t(:'passwords.email_not_found', :email => params[:email]).html_safe
    end
  end
  
  def edit
    @account = Account.find_by_password_reset_token(params[:token])
    if @account && @account.valid?
      render 'edit'
    else
      @account = Account.new if !@account
      flash[:error] = I18n.t(:'activerecord.errors.accounts.password_reset_token_invalid')
      redirect_to root_path
    end
  end
  
  def update
    @account = Account.find(params[:account_id])
    @account.remembered_at = nil # reset remembered_at to clear user cookies
    @account.password_set_at = Time.now
    if @account.update_attributes(params[:account])
      redirect_to root_path, :notice => I18n.t(:'passwords.updated')
    else
      render 'edit'
    end
  end
end
