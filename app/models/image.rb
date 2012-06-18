class Image < ActiveRecord::Base
  belongs_to :page
  attr_accessible :img, :remote_img_url
  mount_uploader :img, ImageUploader
  attr_accessor :remote_img_url
end
