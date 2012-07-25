class Like < ActiveRecord::Base
  belongs_to :post, :counter_cache => "likes_count"
  belongs_to :user
  
  has_many :notifications, :as => :notifier

  attr_accessible :user
  
  validates :user_id, :uniqueness => { :scope => :post_id }
  
  before_save :notify
  
  protected
  
  def notify
    self.notifications.build(:user => self.post.user)
  end
end
