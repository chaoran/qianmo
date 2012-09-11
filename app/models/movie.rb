class Movie < ActiveRecord::Base
  belongs_to :page
  attr_accessible :also_known_as, :directed_by, :country, :genre, :title, :image, :remote_image_url,
                  :released_on, :starring, :storyline, :studio, :written_by
  
  mount_uploader :image, ImageUploader
  attr_accessor :douban_summary, :douban_id, :douban_image
end
