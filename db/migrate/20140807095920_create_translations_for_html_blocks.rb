class CreateTranslationsForHtmlBlocks < ActiveRecord::Migration
  def up
    change_table :html_blocks do |t|
      t.belongs_to :page, polymorphic: true
    end
    HtmlBlock.create_translation_table!
  end

  def down
    t.remove_belongs_to :page, polymorphic: true
    HtmlBlock.drop_translation_table!
  end
end
