# encoding: UTF-8

class Gallery < ActiveRecord::Base
  belongs_to :user
  belongs_to :page
  attr_reader :page_name
  attr_accessible :title, :user_id, :page_name
  
  has_many :pictures, :order => "created_at DESC", :include => [:post]
  
  validates_presence_of :title
  validates_uniqueness_of :title, :scope => [:user_id]
  validates_uniqueness_of :title, :scope => [:page_id]
    
  def page_name=(input)
    unless input.blank?
      self.page = Page.find_by_title(input[/[#＃][^\s\;:]*/][1..-1])
    end
  end
end
