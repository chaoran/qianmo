class Event < ActiveRecord::Base
  belongs_to :receiver, :polymorphic => true
  belongs_to :trigger, :polymorphic => true
  attr_accessible :trigger, :receiver

  validates :trigger, :receiver, :presence => true
end
