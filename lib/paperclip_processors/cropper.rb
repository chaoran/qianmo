module Paperclip
  class Cropper < Thumbnail
    def initialize(file, options = {}, attachment = nil)
      super

      @frontpage_w = 200
      @frontpage_h = 300
      
    end
    
    def transformation_command         
      target = @attachment.instance
      if target.cropping? && @target_geometry.to_s == "100x100#" 
        scale = @frontpage_h / @current_geometry.height
        adjustment = (scale * @current_geometry.width - @frontpage_w) / 2
        resize = 100.0 / target.crop_h.to_i * @frontpage_h
        crop_w = 100.0
        crop_h = 100.0
        crop_x = (target.crop_x.to_i + adjustment) / scale * (resize / @current_geometry.height)
        crop_y = target.crop_y.to_i / scale * (resize / @current_geometry.height)
        trans = []
        trans << "-coalesce" if animated?
        trans << "-resize" << %["x#{resize}"]
        trans << "-crop" << %["#{crop_w}x#{crop_h}+#{crop_x}+#{crop_y}"] << "+repage"
        trans
      else
        super
      end
    end # transformation_command
  end
end