class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process eager: true  # Force version generation at upload time.

  version :standard do
    resize_to_fill 400, 300
  end

  version :thumb do
    resize_to_fill 100, 100
  end
end
