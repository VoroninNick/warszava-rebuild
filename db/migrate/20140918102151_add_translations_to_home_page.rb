class AddTranslationsToHomePage < ActiveRecord::Migration
  def up
    Pages::HomePage.create_translation_table!
  end

  def down
    Pages::HomePage.drop_translation_table!
  end
end
