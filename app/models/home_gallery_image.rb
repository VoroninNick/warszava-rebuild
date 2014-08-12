class HomeGalleryImage < ActiveRecord::Base
  belongs_to :home_page, class_name: Pages::HomePage

  attr_accessible :image
  mount_uploader :image, HomeGalleryImageUploader
  attr_accessible :remove_image, :image_cache

  attr_accessible :name, :alt, :title, :home_page_id

end
