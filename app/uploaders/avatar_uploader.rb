# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  include Sprockets::Helpers::RailsHelper
  include Sprockets::Helpers::IsolatedHelper

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url
    # For Rails 3.1+ asset pipeline compatibility:
    #asset_path("fallback/" + [version_name, "default.jpg"].compact.join('_'))
    asset_path("fallback/default.jpg")
  end

  # Process files as they are uploaded:
  process :scale => [210, 315]
  
  def scale(width, height)
    # Identify if this is a landscape picture
    pic = Magick::Image.read(@file.path).first
    if pic.columns >= pic.rows
      resize_to_fit(width, height)
    else
      resize_to_fill(width, height)
    end
  end

  # Create different versions of your uploaded files:
  version :thumb do
    process :crop
    process :resize_to_fill => [100, 100]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
  
  def check_if_landscape
    pic = Magick::Image.read(@file.path).first
    @is_landscape ||= pic.columns >= pic.rows
  end

  def portrait? img
    return ! landscape?(img)
  end
  
  def crop
    if model.crop_x.present?
      manipulate! do |img|
        x = model.crop_x.to_i
        y = model.crop_y.to_i
        w = model.crop_w.to_i
        h = model.crop_h.to_i
        img.crop!(x, y, w, h)
      end
    end
  end
end
