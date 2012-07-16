class Post < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  include Trigger  
  belongs_to :user
  
  belongs_to :parent, :class_name => 'Post', :counter_cache => :children_count
  belongs_to :sharable, :polymorphic => true, :counter_cache => :shares_count
  has_many :children, :class_name => 'Post', :foreign_key => "parent_id"
  
  has_many :mention_events, :as => :trigger, :dependent => :delete_all
  has_many :comments, :as => :commentable, :dependent => :destroy, :include => [:user, :liked_users]
  has_many :likes, :as => :likable, :dependent => :destroy
  has_many :liked_users, :through => :likes, :source => :user
  has_many :abouts
  has_many :pages, :through => :abouts
  attr_accessible :source, :text, :parent_id

  after_initialize do |post| # repost's initial text
    if post.parent_id && !post.text
      parent = Post.find(post.parent_id)
      post.text = " //@" + parent.user.name + ": " + Sanitize.clean(parent.text)
    end
  end

  before_validation :sanitize_input
  around_save :trigger_events
  validates_presence_of :user, :text
  
  def brief
    if self.text.length > 20 
      self.text[0..20] + "..."
    else
      self.text
    end
  end
end
