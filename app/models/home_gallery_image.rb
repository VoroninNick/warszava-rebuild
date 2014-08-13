class HomeGalleryImage < ActiveRecord::Base
  belongs_to :home_page, class_name: Pages::HomePage

  attr_accessible :image
  mount_uploader :image, HomeGalleryImageUploader
  attr_accessible :remove_image, :image_cache

  attr_accessible :name, :alt, :title, :home_page_id, :file_name

  #before_save :check_rename_image

  def check_rename_image
    if file_name_changed?
      new_name = file_name || ''
      if new_name.nil?
        new_name = ''
      end
      old_name = file_name_was
      if old_name.nil?
        old_name = ''
      end

      if old_name != '' && new_name != '' && old_name != new_name

        image.versions.keys.each do | key |
          file_path = image.path(key)
          folder = File.dirname(file_path)

          new_path = folder + '/' + new_name
          old_path = folder + '/' + old_name
          FileUtils.mv old_path, new_path
        end
      end
    end
  end

  rails_admin do
    edit do
      field :image
      field :name
      field :alt
      field :title

    end
  end

end
