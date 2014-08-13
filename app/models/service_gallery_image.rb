class ServiceGalleryImage < ActiveRecord::Base
  belongs_to :service

  attr_accessible :image
  mount_uploader :image, ServiceGalleryImageUploader
  attr_accessible :remove_image, :image_cache

  attr_accessible :name, :alt, :title, :file_name

  rails_admin do
    edit do
      field :image
      field :name
      field :alt
      field :title

    end
  end
end
