class Comment < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  include Trigger
  belongs_to :commentable, :polymorphic => true
  belongs_to :user
  has_many :events, :as => :trigger
  has_many :like_comments, :dependent => :destroy
  has_many :liked_users, :through => :like_comments, :source => :user, :class_name => "User"
  attr_accessible :text, :source, :commentable_id, :commentable_type
  
  before_validation :sanitize_input
  around_save :trigger_events
end
