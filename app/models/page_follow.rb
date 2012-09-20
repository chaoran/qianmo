class PageFollow < ActiveRecord::Base
  belongs_to :page
  belongs_to :user
  # attr_accessible :title, :body
  validates_presence_of :page, :user
end
