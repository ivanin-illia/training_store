class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :small_img do
    process resize_to_fill: [250, 250]
  end

  def default_url
    ActionController::Base.helpers.asset_path('fallback/default.png')
  end

  def extension_whitelist
    %w[pg jpeg gif png jpg]
  end
end
