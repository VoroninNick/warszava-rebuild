class CreateRoomGalleryImages < ActiveRecord::Migration
  def change
    create_table :room_gallery_images do |t|
      t.string :image
      t.string :name
      t.string :alt
      t.string :title
      t.belongs_to :room
      t.timestamps
    end
  end
end
