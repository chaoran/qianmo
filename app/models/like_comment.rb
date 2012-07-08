class LikeComment < ActiveRecord::Base
  belongs_to :user
  belongs_to :comment
  attr_accessible :user, :comment
  
  validates :comment_id, :uniqueness => { :scope => :user_id }
end
