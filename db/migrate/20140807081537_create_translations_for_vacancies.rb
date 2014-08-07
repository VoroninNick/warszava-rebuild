class CreateTranslationsForVacancies < ActiveRecord::Migration
  def up
    Vacancy.create_translation_table!
  end

  def down
    Vacancy.drop_translation_table!
  end
end
