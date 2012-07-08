class MentionEvent < ActiveRecord::Base
  belongs_to :receiver, :class_name => "User"
  belongs_to :trigger, :polymorphic => true
  attr_accessible :receiver

  validates :receiver_id, :uniqueness => {:scope => [:trigger_id, :trigger_type]}
end
