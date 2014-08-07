class CreateNews < ActiveRecord::Migration
  def change
    Cms::ContentType.create!(:name => "New", :group_name => "New")
    create_content_table :news, :prefix=>false do |t|
      t.string :name
      t.text :description
      

      t.timestamps
    end
  end
end
