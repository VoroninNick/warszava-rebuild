class CreateBanners < ActiveRecord::Migration
  def change
    Cms::ContentType.create!(:name => "Banner", :group_name => "Banner")
    create_content_table :banners, :prefix=>false do |t|
      t.string :name
      

      t.timestamps
    end
  end
end
