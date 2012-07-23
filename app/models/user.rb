class User < ActiveRecord::Base
  belongs_to :account
  
  mount_uploader :avatar, AvatarUploader
  
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
  
  attr_accessor :crop_x, :crop_y, :crop_h, :crop_w
  
  attr_accessible :name, :sex, :date_of_birth, 
                  :hometown, :lives_in, 
                  :status, :last_seen_at, 
                  :avatar, :remote_avatar_url, :crop_x, :crop_y, :crop_h, :crop_w

  validates_presence_of :name, :date_of_birth
  validates_inclusion_of :sex, :in => [true, false]
  validates_uniqueness_of :name
  
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
