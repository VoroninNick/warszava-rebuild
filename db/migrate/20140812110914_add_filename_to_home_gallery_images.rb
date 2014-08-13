class AddFilenameToHomeGalleryImages < ActiveRecord::Migration
  def change
    add_column :home_gallery_images, :file_name, :string
  end
end
