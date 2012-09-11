class News < ActiveRecord::Base
  belongs_to :page
  attr_accessible :summary, :title, :url
end
