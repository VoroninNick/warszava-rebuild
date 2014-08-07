class CreateRooms < ActiveRecord::Migration
  def change
    Cms::ContentType.create!(:name => "Room", :group_name => "Room")
    create_content_table :rooms, :prefix=>false do |t|
      t.string :name
      t.text :full_description, :size => (64.kilobytes + 1)
      

      t.timestamps
    end
  end
end
