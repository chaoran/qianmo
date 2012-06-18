class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :token_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         :omniauthable
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  has_one :profile
  has_many :pages, :as => :creator
  mount_uploader :avatar, AvatarUploader
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :username, :name, :password, :password_confirmation, :remember_me,
                  :avatar, :remote_avatar_url, :crop_x, :crop_y, :crop_w, :crop_h
  
  validates_uniqueness_of :username, :email
  validates_presence_of :name, :email
  
  after_update :crop_avatar
  
  protected
  
  def crop_avatar
      avatar.recreate_versions! if crop_x.present?
  end
  
end
