class AddTranslationsToAboutPage < ActiveRecord::Migration
  def up
    Pages::AboutPage.create_translation_table!
  end

  def down
    Pages::AboutPage.drop_translation_table!
  end
end
