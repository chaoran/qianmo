class LikePost < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  attr_accessible :user, :post
  
  validates :post_id, :uniqueness => { :scope => :user_id }
end
