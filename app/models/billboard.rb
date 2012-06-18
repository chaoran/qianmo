class Billboard < ActiveRecord::Base
  belongs_to :page
  attr_accessible :button_name, :button_value, :content, :header
  
  validates_presence_of :content, :header
end
