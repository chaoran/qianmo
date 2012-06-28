class LikeComment < ActiveRecord::Base
  belongs_to :user
  belongs_to :comment
  attr_accessible :user, :comment
end
