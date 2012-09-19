# encoding: UTF-8
class Article < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  
  belongs_to :user
  belongs_to :page
  attr_reader :page_name
  
  attr_accessible :user, :content, :title, :description, :published, :page_name
  attr_accessor :publish
  
  has_one :post, :as => :entity, :conditions => "ancestor_id is null", 
                 :autosave => true, :dependent => :destroy

  validates_presence_of :title, :content, :user
  validates_uniqueness_of :title, :scope => [:user_id]
  validates_uniqueness_of :title, :scope => [:page_id]
  
  before_save :publish_article, :if => "self.publish"
  
  def page_name=(input)
    unless input.blank?
      self.page = Page.find_by_title(input[/[#＃][^\s\;:]*/][1..-1])
    end
  end
  
  def publish_article
    self.published = true
    self.post.destroy if self.post
    self.build_post(:user => self.user, :text => self.description)
  end
  
  def brief
    text = Sanitize.clean(self.content)
    if text.length > 24 
      text[0..23] + "..."
    else
      text
    end
  end
  
  def brief_title 
    if self.title.length > 6 
      self.title[0..5] + "..."
    else
      self.title
    end
  end
  
  def preview(limit = 100, styled = false)
    text = styled ? self.content : Sanitize.clean(self.content)
    if text.length > limit 
      text[0..limit-1] + "..."
    else
      text
    end
  end
  
  def preview_title 
    if self.title.length > 20 
      self.title[0..19] + "..."
    else
      self.title
    end
  end
end
