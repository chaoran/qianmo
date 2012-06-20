class Page < ActiveRecord::Base
  attr_accessible :title, :intro, :editable,
                  :has_billboard, :has_whiteboard, :has_properties, :has_image, :has_posters,
                  :twittable, :picturable, :commentable, :discussable, 
                  :ratable, :chatable, :checkinable, 
                  :properties_attributes, :posters_attributes, 
                  :billboard, :image, :remote_image_url
  belongs_to :creator, :polymorphic => true
  mount_uploader :image, ImageUploader
  has_one :billboard
  has_one :whiteboard
  has_many :properties, :order => "id"
  accepts_nested_attributes_for :properties, :allow_destroy => true
  has_many :posters, :order => "id"
  accepts_nested_attributes_for :posters, :limit => 5, :allow_destroy => true
  
  attr_accessor :twittable, :picturable, :commentable, :discussable, :ratable, :chatable, :checkinable
  
  validates_presence_of :title, :intro, :creator 
end
