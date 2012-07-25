class Post < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  
  attr_accessible :text, :type, :parent_id, :ancestor_id
  
  belongs_to :user
  
  # If a post has a parent, it is a comment post
  belongs_to :parent, :class_name => 'Post', :counter_cache => :comments_count, :include => [:user]
  has_many :comments, :class_name => 'Post', :foreign_key => "parent_id", :dependent => :destroy,
                      :include => [:user, :liked_users]
                      
  # If a post has an ancestor, it is a repost
  belongs_to :ancestor, :class_name => 'Post', :counter_cache => :reposts_count, :include => [:user]
  has_many :reposts, :class_name => 'Post', :foreign_key => "ancestor_id", :dependent => :destroy
  
  # A post can mention many users
  has_many :mentions  
  has_many :mentioned_users, :through => :mentions, :source => :user
  
  # A post can be about many pages
  has_many :abouts
  
  # A post can be liked by many users
  has_many :likes
  has_many :liked_users, :through => :likes, :source => :user
  
  # A post can be subscribed by many followers
  has_many :notifications, :as => :notifier
  has_many :notified_users, :through => :notifications, :source => :user
  
  # If this is a repost, initialize its text
  after_initialize :initialize_repost, :if => :is_repost?
  before_validation :sanitize_input
  before_save :notify_parent, :if => :is_comment?
  before_save :notify_ancestor, :if => :is_repost?
  before_save :setup_mentions, :setup_abouts
  after_save :notify_subscribers, :unless => :is_comment?
  
  validates_presence_of :user, :text
  
  def brief
    text = Sanitize.clean(self.text)
    if text.length > 20 
      text[0..18] + "..."
    else
      text
    end
  end
  
  def publish_to_users
    users = self.notified_users
    users += self.mentioned_users
    users.uniq! if users.length > 0
    users
  end
  
  def is_comment?
    !self.parent_id.nil?
  end
  
  def is_repost?
    !self.ancestor_id.nil?
  end
  
  protected
  def initialize_repost
    ancestor = Post.find(self.ancestor_id)
    self.text = " //@" + ancestor.user.name + ": " + Sanitize.clean(ancestor.text)
  end
  
  def sanitize_input
    self.text = Sanitize.clean(self.text) # Sanitize input first to avoid security holes
  end
  
  def notify_parent
    self.notifications.build(:user => self.parent.user) unless self.parent.user == self.user
  end
  
  def notify_ancestor
    self.notifications.build(:user => self.ancestor.user) unless self.ancestor.user == self.user
  end
  
  def setup_mentions
    users = []
    
    self.text.gsub!(/@[^\s;:]*/) do |m| # find @{user.name}
      name = m.to_s[1..-1]
      unless name.blank?
        if user = User.find_by_name(name)
          users << user unless users.include?(user)
          replace = "<a href=\"#{user_path(user)}\">" + m + "</a>" # replace with a link
        else
          m
        end
      end
    end
    users.uniq! if users.length > 0
    for user in users
      self.mentions.build(:user => user)
    end
  end
  
  def setup_abouts
    pages = []
    self.text.gsub!(/#[^\s;:]*/) do |m| # find #{page.title}
      title = m.to_s[1..-1]
      unless title.blank?
        if page = Page.find_by_title(title)
          pages << page unless pages.include?(page)
          replace = "<a href=\"#{page_path(page)}\">" + m + "</a>" # replace with a link
        else
          m
        end
      end
    end
    pages.uniq! if pages.length > 0
    for page in pages
      self.abouts.build(:page => page)
    end
  end
  
  def notify_subscribers
    for subscriber in self.user.subscribers.reject {|s| self.mentioned_users.include?(s) }
      self.notifications.build(:user => subscriber)
    end
  end
end
