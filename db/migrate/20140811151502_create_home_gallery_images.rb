class CreateHomeGalleryImages < ActiveRecord::Migration
  def change
    create_table :home_gallery_images do |t|
      t.string :image
      t.string :name
      t.string :alt
      t.string :title
      t.belongs_to :home_page

      t.timestamps
    end
  end
end
