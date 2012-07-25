class Mention < ActiveRecord::Base
  attr_accessible :user
  
  belongs_to :post
  belongs_to :user
  
  has_many :notifications, :as => :notifier
  
  before_save :notify, :unless => :user_is_ancestor_or_parent?
  
  protected
  def user_is_ancestor_or_parent?
    (self.post.is_repost? && self.post.ancestor.user == self.user) || 
    (self.post.is_comment? && self.post.parent.user == self.user)
  end
  
  def notify
    self.notifications.build(:user => self.user)
  end
end
