class Comment < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  include Trigger
  belongs_to :commentable, :polymorphic => true
  belongs_to :user
  has_many :events, :as => :trigger
  attr_accessible :text, :source, :commentable_id, :commentable_type
  
  before_validation :sanitize_input
  around_save :trigger_events
end
