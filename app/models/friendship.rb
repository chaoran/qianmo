class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => 'User'
  #attr_accessible :user, :friend_id
  after_create :be_friendly_to_friend
  after_destroy :no_more_friendly
  
  def be_friendly_to_friend
    friend.friends << user unless friend.friends.include?(user)
  end
  
  def no_more_friendly
    friend.friends.delete(user)
  end
end
