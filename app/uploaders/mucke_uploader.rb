# encoding: utf-8

class MuckeUploader < CarrierWave::Uploader::Base

include CarrierWave::RMagick

# # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
# # include Sprockets::Helpers::RailsHelper
# # include Sprockets::Helpers::IsolatedHelper

# # Create different versions of your uploaded files:
  version :standard do
    process :resize_to_fill => [300, 450]
  end

  version :medium do
    process :resize_to_fill => [150, 200]
  end

  version :small do
    process :resize_to_fit => [50, 50]
  end

  # White list of extensions which are allowed to be uploaded.
  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
