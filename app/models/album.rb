class Album < ActiveRecord::Base
  belongs_to :page
  has_many :songs
  attr_accessible :artist, :genre, :introduction, :title, :released_on, :edition, :country,
                  :studio, :tracks, :cover, :remote_cover_url
  
  mount_uploader :cover, ImageUploader
  validates :tracks, :length => { :maximum => 300 }
  validates_presence_of :title, :artist, :cover
  
  protected
  
  def intro_preview
    self.introduction[0..400] + "..."
  end
end
