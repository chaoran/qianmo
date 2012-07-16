class Comment < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  include Trigger
  belongs_to :commentable, :polymorphic => true, :counter_cache => :comments_count
  belongs_to :user
  has_many :mention_events, :as => :trigger, :dependent => :delete_all
  has_many :likes, :as => :likable, :dependent => :destroy
  has_many :liked_users, :through => :likes, :source => :user
  
  default_scope :order => 'created_at'
  
  attr_accessible :text, :source, :commentable_id, :commentable_type
  
  before_validation :sanitize_input
  around_save :trigger_events
end
