class ChangeRoomFieldTypes < ActiveRecord::Migration
  def up
    change_column :rooms, :name, :text
    change_column :rooms, :full_description, :text

    change_column Room.translation_class.table_name, :name, :text
    change_column Room.translation_class.table_name, :full_description, :text
  end

  def down
    change_column :rooms, :name, :string
    change_column :rooms, :full_description, :string

    change_column Room.translation_class.table_name, :name, :string
    change_column Room.translation_class.table_name, :full_description, :string
  end
end
