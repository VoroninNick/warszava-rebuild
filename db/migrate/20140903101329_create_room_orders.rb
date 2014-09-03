class CreateRoomOrders < ActiveRecord::Migration
  def change
    create_table :room_orders do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.text :message

      t.belongs_to :room

      t.timestamps
    end
  end
end
