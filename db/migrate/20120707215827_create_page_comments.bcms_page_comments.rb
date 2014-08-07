# This migration comes from bcms_page_comments (originally 20090417155756)
class CreatePageComments < ActiveRecord::Migration
  def change
    create_versioned_table :page_comments do |t|
      t.belongs_to :page 
      t.string :name 
      t.string :email 
      t.string :url 
      t.text :body 
      t.string :ip 
    end
  end
end
