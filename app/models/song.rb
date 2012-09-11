class Song < ActiveRecord::Base
  belongs_to :page
  belongs_to :album
  attr_accessible :artist, :genre, :lyrics, :name
end
