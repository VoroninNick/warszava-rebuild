class CreateTranslationsForArticles < ActiveRecord::Migration
  def up
    Article.create_translation_table!
  end

  def down
    Article.drop_translation_table!
  end
end
