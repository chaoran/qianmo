class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :notifier, :polymorphic => true
  attr_accessible :read
end
