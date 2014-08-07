class CreateTranslationsForRooms < ActiveRecord::Migration
  def up
    Room.create_translation_table!
  end

  def down
    Room.drop_translation_table!
  end
end
