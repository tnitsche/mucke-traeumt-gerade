class Photo < ActiveRecord::Base
  attr_accessible :description, :image, :image_cache, :remote_image_url, :remove_image, :title

  mount_uploader :image, MuckeUploader

   validates_presence_of :title
   validates_presence_of :image
end
