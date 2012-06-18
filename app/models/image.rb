class Image < ActiveRecord::Base
  belongs_to :page
  attr_accessible :img
  mount_uploader :img, ImageUploader
end
