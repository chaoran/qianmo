class Account < ActiveRecord::Base
  include Token
  
  attr_accessible :email, :password, :password_confirmation, :password_set_at, :username,
                  :user_attributes, :password_reset_token
  
  has_secure_password
  
  attr_accessor :remember_me
  
  has_one :user
  accepts_nested_attributes_for :user
  
  has_one :confirmation
  
  delegate :name, :to => :user

  validates_presence_of :password, :on => :create
  validates_confirmation_of :password, :on => :update
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_uniqueness_of :username, :allow_blank => true
  validate :password_reset_token_is_valid, :on => :update
  
  def self.deserialize(id, token)
    account = Account.find(id)
    account if account && account.remember_token == token
  end
  
  def remember_me!(warden)
    self.remembered_at = Time.now
    save :validate => false
    warden.cookies.signed["remember_token"] = { :httponly => true,
                                                :value => self.serialize,
                                                :expires => Time.now + 30.days }
  end
  
  def forget_me!(warden)
    warden.cookies.delete("remember_token")
    return unless persisted?
    self.remembered_at = nil
    save(:validate => false)
  end
  
  def remember_token
    self.password_digest[0,29] # use password digest as remember_token
  end
  
  def remember_expired?
    self.remembered_at.nil? || (self.remembered_at < 30.days.ago)
  end
  
  def confirmed?
    !self.confirmed_at.nil?
  end
  
  def send_confirmation_instructions(email = nil)
    self.build_confirmation if self.confirmation.nil?
    self.confirmation.unconfirmed_email = email ? email : self.email unless self.confirmation.unconfirmed_email
    self.confirmation.generate_confirmation_token!
    begin
      UserMailer.confirm_email(self.confirmation).deliver
    rescue
      # do_nothing
    end
  end
  
  def unconfirmed_email
    if self.confirmation
      self.confirmation.unconfirmed_email
    else
      nil
    end
  end
  
  def sent_reset_password_instructions
    generate_password_reset_token!
    UserMailer.reset_password(self).deliver
  end
  
  protected
  
  def serialize
    [self.id, self.remember_token]
  end

  def remember_expires_at
    30.days.after
  end
  
  def password_reset_token_is_valid
    if password_reset_token
      account = Account.find(id)
      if account.password_reset_token != password_reset_token || 
         account.password_reset_sent_at < 2.hours.ago
        errors.add(:password_reset_token, :password_reset_token_invalid) 
      end
    end
  end
  
  def generate_password_reset_token!
    self.password_reset_token = generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.now
    save!(:validate => false)
  end
end
