class Profile < ActiveRecord::Base
  attr_accessible :date_of_birth, :sex, :hometown, :current_city
  belongs_to :user
  has_attached_file :avatar, :styles => { 
                      :frontpage => '200x300#', 
                      :thumb => "100x100#" 
                    },
                    :default_url => '/assets/avatar_male.jpg', :processors => [:cropper]
                      
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  attr_accessible :avatar, :crop_x, :crop_y, :crop_w, :crop_h
  after_update :reprocess_avatar, :if => :cropping?
  
  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end
  
  def avatar_geometry(style = :original)
    @geometry ||= {}
    @geometry[style] ||= Paperclip::Geometry.from_file(avatar.path(style))
  end
  
  private
  
  def reprocess_avatar
    avatar.reprocess!
  end
end
