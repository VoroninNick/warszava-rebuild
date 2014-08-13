class CreateAboutPageGalleryImages < ActiveRecord::Migration
  def change
    create_table :about_page_gallery_images do |t|
      t.string :image
      t.string :name
      t.string :alt
      t.string :title
      t.belongs_to :about_page

      t.timestamps
    end
  end
end
