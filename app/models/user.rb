class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :token_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         :omniauthable
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h, :remote_avatar_url

  has_one :profile
  
  has_many :follows, :dependent => :delete_all
  has_many :followers, :through => :follows, :source => :follower
  
  has_many :friendships, :dependent => :destroy
  has_many :friends, :through => :friendships, :source => :friend, :dependent => :destroy
  has_many :friend_events, :foreign_key => "receiver_id", :dependent => :delete_all, 
                           :order => "created_at"
  has_many :unread_friend_events, :class_name => "FriendEvent", :foreign_key => "receiver_id",
                                  :dependent => :delete_all, 
                                  :conditions => "consumed = false"
  
  has_many :pages, :as => :creator
  has_many :posts, :order => "created_at DESC"
  has_many :events, :as => :receiver
  
  has_many :like_posts, :dependent => :destroy
  has_many :liked_posts, :through => :like_posts, :class_name => "Post"
  
  mount_uploader :avatar, AvatarUploader
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :username, :name, :password, :password_confirmation, :remember_me,
                  :avatar, :remote_avatar_url, :crop_x, :crop_y, :crop_w, :crop_h
  
  validates_presence_of :name, :email
  validates_uniqueness_of :username, :email, :name
  validates :avatar, :file_size => { :maximum => 0.5.megabytes.to_i }
  after_update :crop_avatar
  
  def is_male?
    return profile.sex;
  end
  
  protected
  
  def crop_avatar
      avatar.recreate_versions! if crop_x.present?
  end
  
end
