class Book < ActiveRecord::Base
  belongs_to :page
  attr_accessible :author, :publisher, :released_on, :subtitle, :title, :translator
end
