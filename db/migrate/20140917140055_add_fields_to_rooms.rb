class AddFieldsToRooms < ActiveRecord::Migration
  def change
    change_table :rooms do |t|
      t.integer :quantity
      t.float :price_per_night
      t.float :extra_bed_price
    end
  end
end
