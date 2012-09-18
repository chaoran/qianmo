class Gallery < ActiveRecord::Base
  belongs_to :user
  belongs_to :page
  attr_accessible :title, :user_id
  
  has_many :pictures, :order => "created_at DESC", :include => [:post]
  
  attr_accessor :page_name
  
  validates_presence_of :title
  validates_uniqueness_of :title, :scope => [:user_id]
  validates_uniqueness_of :title, :scope => [:page_id]
end
