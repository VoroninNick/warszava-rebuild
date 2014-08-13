class CreatePagesRoomsLists < ActiveRecord::Migration
  def up
    create_table :rooms_list_page do |t|
      t.text :intro_text
      t.timestamps
    end

    Pages::RoomsList.create_translation_table!
  end

  def down
    drop_table :rooms_list_page

    Pages::RoomsList.drop_translation_table!
  end

end
