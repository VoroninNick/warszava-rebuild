class CreatePagesRestaurants < ActiveRecord::Migration
  def up
    create_table :restaurant_page do |t|
      t.text :content
      t.timestamps
    end

    Pages::Restaurant.create_translation_table!
  end

  def down
    drop_table :restaurant_page

    Pages::Restaurant.drop_translation_table!
  end
end
