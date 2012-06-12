class UserMailer < ActionMailer::Base
  default from: "do_not_reply@gonglue.com"
  
  def confirmation_email(user)
    @user = user
  end
end
