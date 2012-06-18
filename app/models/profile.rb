class Profile < ActiveRecord::Base
  attr_accessible :date_of_birth, :sex, :hometown, :current_city
  belongs_to :user

end
