class CreatePagesServices < ActiveRecord::Migration

  def up
    create_table Pages::Services.table_name do |t|
      t.text :intro
      t.timestamps
    end

    Pages::Services.create_translation_table!
  end

  def down
    drop_table Pages::Services.table_name

    Pages::Services.drop_translation_table!
  end
end
