class Picture < ActiveRecord::Base
  belongs_to :gallery
  accepts_nested_attributes_for :gallery
  
  attr_accessible :description, :mentions, :image, :remote_image_url, 
                  :gallery_id, :gallery_attributes, :post_attributes
  
  mount_uploader :image, PictureUploader
  
  has_one :post, :as => :entity, :conditions => "ancestor_id is null", 
                 :autosave => true, :dependent => :destroy
  accepts_nested_attributes_for :post
  
  validates_presence_of :gallery
end
