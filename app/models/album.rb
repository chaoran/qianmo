class Album < ActiveRecord::Base
  belongs_to :page
  has_many :songs
  attr_accessible :artist, :genre, :introduction, :name, :released_on
  
end
