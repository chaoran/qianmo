class Confirmation < ActiveRecord::Base
  include Token
  
  belongs_to :account
  attr_accessible :confirmation_sent_at, :confirmation_token, :confirmed_at, :unconfirmed_email
  
  def self.confirm_by_token!(token)
    confirmation = Confirmation.find_by_confirmation_token(token)
    if confirmation
      account = confirmation.account
      account.confirmed_at = Time.now
      if confirmation.unconfirmed_email
        account.email = confirmation.unconfirmed_email
      end
      account.save!
      confirmation.destroy
      return account
    else
      return nil
    end
  end
  
  def generate_confirmation_token!
    self.confirmation_token = generate_token(:confirmation_token)
    self.confirmation_sent_at = Time.now
    save!
  end

end
