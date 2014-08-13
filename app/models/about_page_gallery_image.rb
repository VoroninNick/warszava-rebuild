class AboutPageGalleryImage < ActiveRecord::Base
  belongs_to :about_page, class_name: Pages::HomePage

  attr_accessible :image
  mount_uploader :image, AboutPageGalleryImageUploader
  attr_accessible :remove_image, :image_cache

  attr_accessible :name, :alt, :title, :home_page_id, :file_name

  rails_admin do
    edit do
      field :image
      field :name
      field :alt
      field :title

    end
  end
end
