class FriendEvent < ActiveRecord::Base
  belongs_to :trigger, :class_name => 'User'
  belongs_to :receiver, :class_name => 'User'
  attr_accessible :consumed, :event_type, :trigger
end
