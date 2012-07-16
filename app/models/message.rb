class Message < ActiveRecord::Base
  belongs_to :user, :class_name => 'User'
  belongs_to :from
  attr_accessible :body, :title, :read, :flaged
end
