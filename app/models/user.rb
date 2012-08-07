class User < ActiveRecord::Base
  attr_accessible :name, :sex, :date_of_birth, 
                  :hometown, :lives_in, 
                  :status, :last_seen_at, 
                  :avatar, :remote_avatar_url, :crop_x, :crop_y, :crop_h, :crop_w       
                  
  belongs_to :account
  
  mount_uploader :avatar, AvatarUploader
  
  has_many :follows
  has_many :special_follows, :class_name => 'Follow', :conditions => { :special => true }
  has_many :followers, :through => :follows, :source => :follower
  has_many :subscribers, :through => :special_follows, :source => :follower
                           
  has_many :followed, :class_name => "Follow", :foreign_key => "follower_id"
  has_many :followed_users, :through => :followed, :source => "user"
  
  has_many :friendships, :class_name => 'Follow', :foreign_key => 'follower_id', 
                         :conditions => { :friend => true }
  has_many :friends, :through => :friendships, :source => :user
  
  #has_many :followed_posts, :class_name => "Post", :order => "created_at DESC",
  #                          :conditions => "user_id IN (#{self.followed_user_ids})"
  
  has_many :messages, :order => "created_at DESC"
  
  # has_many :mentions 
  # has_many :mentioned_in_posts, :through => :mentions, :source => :post
  
  has_many :notifications, :order => "created_at DESC", :include => [:notifier]
  
  has_many :pages, :foreign_key => "owner_id"
  has_many :posts, :order => "created_at DESC", :conditions => "parent_id is null"
  
  has_many :articles, :include => [:post], :order => "created_at DESC"
  
  has_many :galleries, :include => [:pictures], :order => "created_at DESC"
  
  # has_many :like_posts
  # has_many :liked_posts, :through => :like_posts, :class_name => "Post"
  
  attr_accessor :crop_x, :crop_y, :crop_h, :crop_w

  validates_presence_of :name, :date_of_birth
  validates_inclusion_of :sex, :in => [true, false]
  validates_uniqueness_of :name
  
  validates :avatar, :file_size => { :maximum => 0.5.megabytes.to_i }
  after_update :crop_avatar
  
  def is_male?
    return self.sex;
  end
  
  def stream_posts
    Post.where("user_id IN (?) AND parent_id is null", self.followed_user_ids << self.id).order("created_at DESC").includes(:comments, :user, :liked_users)
  end
  
  def num_unread_follows
    self.follows.where(:read => false).size
  end
  
  def latest_follows
    follows = self.follows.where("created_at > ? OR read = false", 1.week.ago).order("created_at")
  end
  
  def unread_follows
    follows = self.follows.where(:read => false).order("created_at")
  end
  
  def unread_messages
    self.messages.where(:read => false).order("created_at")
  end
  
  def num_unread_nofitications
    self.notifications.where(:read => false).size
  end
  
  def latest_notifications
    self.notifications.where("created_at > ? OR read = false", 1.week.ago).order("created_at")
  end
  
  def unread_notifications
    self.notifications.where(:read => false).order("created_at")
  end
  
  protected
  
  def crop_avatar
      avatar.recreate_versions! if crop_x.present?
  end
end
