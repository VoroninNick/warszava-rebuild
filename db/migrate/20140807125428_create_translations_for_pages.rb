class CreateTranslationsForPages < ActiveRecord::Migration
  def up
    Page.create_translation_table!
  end

  def down
    Page.drop_translation_table!
  end
end
