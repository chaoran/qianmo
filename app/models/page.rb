class Page < ActiveRecord::Base
  attr_accessible :title, :intro, :category, :editable, 
                  :movie_attributes
                  
  belongs_to :user
    
  has_one :book
  has_one :album
  has_one :song
  
  has_one :movie, :autosave => true
  accepts_nested_attributes_for :movie
  
  has_one :news
  
  has_many :abouts
  has_many :posts, :through => :abouts  
  
  has_many :articles
  
  has_many :galleries
    
  validates_presence_of :title, :user, :category
  validates_uniqueness_of :title
  
  def hot_articles
    self.articles.limit(10).order("likes_count DESC")
  end
  
end
