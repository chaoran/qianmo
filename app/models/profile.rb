class Profile < ActiveRecord::Base
  attr_accessible :hometown, :current_city
  belongs_to :user
end
