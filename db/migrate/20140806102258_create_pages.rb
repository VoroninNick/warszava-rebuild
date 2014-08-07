class CreatePages < ActiveRecord::Migration
  def change
    create_table :vs_pages do |t|
      t.string :name
      t.string :path
      t.text :meta_description
      t.text :meta_keywords
      t.string :head_title
      t.string :controller
      t.string :action

      t.belongs_to :custom_page, polymorphic: true

      t.timestamps
    end
  end
end
