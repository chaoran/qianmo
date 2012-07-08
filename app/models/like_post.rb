class LikePost < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  attr_accessible :user, :post_id
  
  validates :post_id, :uniqueness => { :scope => :user_id }
  validate :owner_cannot_like_yours
  
  def owner_cannot_like_yours
    if Post.find(post_id).user.id == user_id
      errors.add(:user_id, "cannot like yourself")
    end
  end
end
