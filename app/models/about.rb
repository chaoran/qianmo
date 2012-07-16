class About < ActiveRecord::Base
  belongs_to :post
  belongs_to :page
  attr_accessible :page
end
