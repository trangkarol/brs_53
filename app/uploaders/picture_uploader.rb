# encoding: utf-8

class PictureUploader < CarrierWave::Uploader::Base

  storage :file
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url(*args)
    "/assets/" + [version_name, "ava-defaut.png"].compact.join('_')
  end
end
