class CreateGalleryTestings < ActiveRecord::Migration
  def change
    Cms::ContentType.create!(:name => "GalleryTesting", :group_name => "GalleryTesting")
    create_content_table :gallery_testings, :prefix=>false do |t|
      t.string :name
      t.string :alt
      

      t.timestamps
    end
  end
end
