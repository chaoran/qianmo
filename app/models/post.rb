class Post < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  include Trigger  
  belongs_to :user
  
  belongs_to :parent, :class_name => 'Post'
  has_many :children, :class_name => 'Post', :foreign_key => "parent_id"
  
  has_many :events, :as => :trigger, :dependent => :destroy
  has_many :comments, :as => :commentable, :dependent => :destroy
  has_many :like_posts, :dependent => :destroy
  has_many :liked_users, :through => :like_posts, :source => :user, :class_name => "User"
  attr_accessible :source, :text, :parent_id

  after_initialize do |post| # repost
    if post.parent_id && !post.text
      parent = Post.find(post.parent_id)
      post.text = " //@" + parent.user.name + ": " + Sanitize.clean(parent.text)
    end
  end

  before_validation :sanitize_input
  around_save :trigger_events
  validates_presence_of :user, :text
end
