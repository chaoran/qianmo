class Follow < ActiveRecord::Base
  belongs_to :follower, :class_name => 'User'
  belongs_to :user
  belongs_to :pair, :class_name => "Follow"
  attr_accessible :special, :friend, :read, :follower, :user, :pair_id
  
  validates :user_id, :uniqueness => {:scope => :follower_id}
end
