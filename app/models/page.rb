class Page < ActiveRecord::Base
  attr_accessible :title, :intro, :editable,
                  :has_billboard, :has_whiteboard, :has_properties, :has_image, :has_posters,
                  :has_posts, :picturable, :commentable, :discussable, 
                  :ratable, :chatable, :checkinable, 
                  :properties_attributes, :posters_attributes, 
                  :image, :remote_image_url
  belongs_to :creator, :polymorphic => true
  mount_uploader :image, ImageUploader
  has_one :billboard
  has_one :whiteboard
  has_many :properties, :order => "id"
  accepts_nested_attributes_for :properties, :allow_destroy => true
  has_many :posters, :order => "id"
  accepts_nested_attributes_for :posters, :limit => 5, :allow_destroy => true
  has_many :abouts
  has_many :posts, :through => :abouts
  has_many :events, :class_name => "PageEvent"
  
  has_many :articles
  
  attr_accessor :has_posts, :picturable, :commentable, :discussable, :ratable, :chatable, :checkinable
  
  validates_presence_of :title, :creator 
  validates_uniqueness_of :title
  
  def hot_articles
    self.articles.limit(10).order("likes_count DESC")
  end
end
