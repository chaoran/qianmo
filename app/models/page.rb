class Page < ActiveRecord::Base
  attr_accessible :title, :intro, :editable,
                  :has_billboard, :has_whiteboard, :has_attribute_group, :has_image, :has_posters,
                  :twittable, :picturable, :commentable, :discussable, 
                  :ratable, :chatable, :checkinable
  belongs_to :creator, :polymorphic => true
  has_one :billboard
  has_one :whiteboard
  has_one :attribute_group
  has_attached_file :image, :style => { :square => '300x300#' }
  has_many :posters
  
  attr_accessor :twittable, :picturable, :commentable, :discussable, :ratable, :chatable, :checkinable
  
  validates_presence_of :title, :intro, :creator 
end
