class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  process :tags => ['boardgame']
end
