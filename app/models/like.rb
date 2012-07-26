class Like < ActiveRecord::Base
  belongs_to :post, :counter_cache => "likes_count"
  belongs_to :user
  
  has_one :notification, :as => :notifier, :dependent => :delete, :include => [:user]
  
  attr_accessible :user
  
  validates :user_id, :uniqueness => { :scope => :post_id }
  
  before_save :notify
  
  protected
  
  def notify
    self.build_notification(:user => self.post.user) unless self.post.user == self.user
  end
end
