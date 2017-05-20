class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :fog

  def extension_white_list
    %w(jpg jpeg gif png bmp tif tiff)
  end

  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  def store_dir
    "uploads/#{model.class.to_s.downcase}/#{model.id}"
  end

  version :thumb do
    process resize_to_fill: [150, 150]
  end

  version :full do
    process resize_to_fill: [300, 300]
  end

  protected

  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) || model.instance_variable_set(var, SecureRandom.uuid)
  end
end
