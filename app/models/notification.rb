class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :notifier, :polymorphic => true
  attr_accessible :read, :user
  
  # validates_uniqueness_of :user_id, :scope => [:notifier_id, :notifier_type]
end
