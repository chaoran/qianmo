class City < ActiveRecord::Base
  attr_accessible :town, :admin, :country
  
  def name
    name = ""
    name += "#{country} " if self.country
    name += "#{admin} #{town}"
    name
  end
  
  def name=(name)
    self.town, self.admin, self.country = name.split(' ')
  end
end
