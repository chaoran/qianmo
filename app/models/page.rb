class Page < ActiveRecord::Base
  attr_accessible :title, :category, :editable, 
                  :movie_attributes, :book_attributes, :album_attributes
                  
  belongs_to :user
    
  has_one :book, :autosave => true
  accepts_nested_attributes_for :book
  
  has_one :album, :autosave => true
  accepts_nested_attributes_for :album
  
  has_one :movie, :autosave => true
  accepts_nested_attributes_for :movie
  
  has_one :news
  
  has_many :abouts
  has_many :posts, :through => :abouts  
  
  has_many :articles, :order => "created_at DESC"
  has_many :galleries, :order => "created_at DESC"
  
  has_many :page_follows
  has_many :followed_users, :through => :page_follows, :source => :user
    
  validates_presence_of :title, :user, :category
  validates_uniqueness_of :title
  
  def hot_articles
    self.articles.limit(10).order("likes_count DESC")
  end
  
end
