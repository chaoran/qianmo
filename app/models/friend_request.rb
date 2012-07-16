class FriendRequest < ActiveRecord::Base
  belongs_to :user
  belongs_to :sender, :class_name => 'User'
  attr_accessible :read, :just_follow, :sender
end
