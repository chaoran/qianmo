class Poster < ActiveRecord::Base
  belongs_to :page
  attr_accessible :caption, :link, :text, :background, :remote_background_url
  mount_uploader :background, PosterUploader
  
  validates :background, :file_size => { :maximum => 1.megabytes.to_i }
  validates :background, :presence => true
end
