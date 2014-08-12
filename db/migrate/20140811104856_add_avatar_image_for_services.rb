class AddAvatarImageForServices < ActiveRecord::Migration
  def change
    change_table :services do |t|
      t.string :avatar
    end
  end
end
