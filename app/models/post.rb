class Post < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  include Trigger  
  belongs_to :user
  belongs_to :parent, :class_name => 'Post'
  has_many :events, :as => :trigger
  has_many :comments, :as => :commentable, :dependent => :destroy
  attr_accessible :num_reposts, :source, :text, :parent

  before_validation :sanitize_input
  around_save :trigger_events
  validates_presence_of :user, :text
end
