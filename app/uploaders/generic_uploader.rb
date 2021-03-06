class GenericUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :fog

  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  def store_dir
    "uploads/#{model.class.to_s.downcase}/#{model.id}"
  end

  protected

  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) || model.instance_variable_set(var, SecureRandom.uuid)
  end
end
