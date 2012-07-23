class OldUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :token_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         :omniauthable
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h, :remote_avatar_url

  has_one :profile
  
  has_many :follows, :dependent => :delete_all, :order => "created_at DESC"
  has_many :followers, :through => :follows, :source => :follower
  has_many :followed, :class_name => "Follow", :foreign_key => "follower_id"
  has_many :followed_users, :through => :followed, :source => "user"
  
  has_many :messages, :dependent => :delete_all, :order => "created_at DESC"
  has_many :notifications, :dependent => :delete_all, :order => "created_at DESC"
  
  has_many :pages, :as => :creator
  has_many :posts, :order => "created_at DESC"
  
  has_many :like_posts, :dependent => :destroy
  has_many :liked_posts, :through => :like_posts, :class_name => "Post"
  
  mount_uploader :avatar, AvatarUploader
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :username, :name, :password, :password_confirmation, :remember_me,
                  :avatar, :date_of_birth, :sex, 
                  :remote_avatar_url, :crop_x, :crop_y, :crop_w, :crop_h
  
  validates_presence_of :name, :email, :sex, :date_of_birth
  validates_uniqueness_of :username, :email, :name
  validates :avatar, :file_size => { :maximum => 0.5.megabytes.to_i }
  after_update :crop_avatar
  
  def is_male?
    return self.sex;
  end
  
  def stream_posts
    return Post.where("user_id IN (?)", self.followed_user_ids << self.id).order("created_at DESC").includes(:comments, :user, :liked_users)
  end
  
  def num_unread_follows
    self.follows.where(:read => false).size
  end
  
  def latest_follows
    follows = self.follows.where("created_at > ? OR read = false", 1.week.ago).order("created_at")
  end
  
  def unread_messages
    self.messages.where(:read => false).order("created_at")
  end
  
  def unread_notifications
    self.notifications.where(:read => false).order("created_at")
  end
  
  protected
  
  def crop_avatar
      avatar.recreate_versions! if crop_x.present?
  end
  
end
