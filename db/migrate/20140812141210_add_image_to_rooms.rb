class AddImageToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :avatar, :string
  end
end
