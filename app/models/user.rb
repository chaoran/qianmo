class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :token_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :username, :name, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  validates_uniqueness_of :username, :email
  validates_presence_of :name, :email
  
  has_one :profile
  has_many :pages, :as => :creator
  
  has_attached_file :avatar, :styles => { 
                      :frontpage => '200x300#', 
                      :thumb => "100x100#" 
                    },
                    :default_url => '/assets/avatar_male.jpg', :processors => [:cropper]
                      
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  attr_accessible :avatar, :crop_x, :crop_y, :crop_w, :crop_h
  after_update :reprocess_avatar, :if => :cropping?
  after_validation :join_avatar_errors

  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png'],
                                    :message => "#{I18n.t :avatar_format_is_jpg_or_png}"
  validates_attachment_size :avatar, :less_than => 1.megabytes, 
                            :unless => Proc.new {|p| p.avatar.nil? },
                            :message => "#{I18n.t :avatar_size_less_than_1m}"
        
  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end
  
  def avatar_geometry(style = :original)
    @geometry ||= {}
    @geometry[style] ||= Paperclip::Geometry.from_file(avatar.path(style))
  end
  
  def join_avatar_errors
    errors[:avatar].delete_if {|e| e.include?("identify")}
    errors.messages[:avatar] = errors[:avatar] +
                               errors[:avatar_file_name] +
                               errors[:avatar_file_size] +
                               errors[:avatar_content_type]
  end
  
  private
  
  def reprocess_avatar
    avatar.reprocess!
  end
  
end
