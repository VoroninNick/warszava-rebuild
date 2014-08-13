class CreateServiceGalleryImages < ActiveRecord::Migration
  def change
    create_table :service_gallery_images do |t|
      t.string :image
      t.string :name
      t.string :alt
      t.string :title
      t.belongs_to :service
      t.timestamps
    end
  end
end
