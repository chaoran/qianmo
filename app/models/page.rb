class Page < ActiveRecord::Base
  attr_accessible :title, :intro, :editable,
                  :has_billboard, :has_whiteboard, :has_attributes, :has_image, :has_posters,
                  :twittable, :picturable, :commentable, :discussable, 
                  :ratable, :chatable, :checkinable, :attributes_attributes
  belongs_to :creator, :polymorphic => true
  has_one :image
  has_one :billboard
  has_one :whiteboard
  has_many :attributes, :order => "id"
  accepts_nested_attributes_for :attributes, :reject_if => :all_blank, :allow_destroy => true
  has_many :posters
  
  attr_accessor :twittable, :picturable, :commentable, :discussable, :ratable, :chatable, :checkinable
  
  validates_presence_of :title, :intro, :creator 
end
