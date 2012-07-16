class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :page
  attr_accessible :text, :title
  
  has_many :likes, :as => :likable, :dependent => :destroy
  has_many :liked_users, :through => :likes, :source => :user
  has_many :posts, :as => :sharable
  
  has_many :comments, :as => :commentable, :dependent => :destroy,
                      :include => [:user, :liked_users]
  
  def brief
    self.title
  end
  
  def sanitized_text
    sanitize(RedCloth.new(self.text, [:filter_html, :filter_styles]).to_html)
  end
end
