class Update < ActiveRecord::Base
  belongs_to :page
  belongs_to :updater, :polymorphic => true
end
