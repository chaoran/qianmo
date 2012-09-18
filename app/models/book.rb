class Book < ActiveRecord::Base
  belongs_to :page
  attr_accessible :author, :country, :publisher, :released_on, :subtitle, :title, 
                  :translator, :cover, :remote_cover_url, :alt_title,
                  :isbn, :pages, :binding, :summary, :genre
  
  mount_uploader :cover, ImageUploader
  
  validates_presence_of :author, :title, :cover
end
