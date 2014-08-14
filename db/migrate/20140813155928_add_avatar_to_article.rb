class AddAvatarToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :avatar, :string
  end
end
