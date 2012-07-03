class Follow < ActiveRecord::Base
  belongs_to :user
  belongs_to :follower, :class_name => 'User'
  # attr_accessible :title, :body
end
