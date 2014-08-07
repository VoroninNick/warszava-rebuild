class CreateArticles < ActiveRecord::Migration
  def change
    Cms::ContentType.create!(:name => "Article", :group_name => "Article")
    create_content_table :articles, :prefix=>false do |t|
      t.string :name
      t.text :description
      

      t.timestamps
    end
  end
end
