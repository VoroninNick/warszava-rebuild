class CreateGalleries < ActiveRecord::Migration
  def change
    Cms::ContentType.create!(:name => "Gallery", :group_name => "Gallery")
    create_content_table :galleries, :prefix=>false do |t|
      t.string :name
      
      
      
      

      t.timestamps
    end
  end
end
