class Property < ActiveRecord::Base
  belongs_to :page
  attr_accessible :label, :value, :page_id
  validates :label, :value, :presence => true
end
