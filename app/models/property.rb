class Property < ActiveRecord::Base
  belongs_to :page
  attr_accessible :label, :value, :page_id
  validates_presence_of :label, :value
end
