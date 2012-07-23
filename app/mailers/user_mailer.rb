class UserMailer < ActionMailer::Base
  default from: "noreply@1000mo.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.confirm_email.subject
  #
  def confirm_email(confirmation)
    @confirmation = confirmation
    @account = confirmation.account
    
    mail :to => confirmation.unconfirmed_email
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.reset_password.subject
  #
  def reset_password(account)
    @account = account

    mail to: @account.email
  end
end
