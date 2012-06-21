class Whiteboard < ActiveRecord::Base
  belongs_to :page
  attr_accessible :text, :title
  
  validates :title, :presence => true
end
