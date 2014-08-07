class CreateServices < ActiveRecord::Migration
  def change
    Cms::ContentType.create!(:name => "Service", :group_name => "Service")
    create_content_table :services, :prefix=>false do |t|
      t.boolean :display_home
      t.string :name
      t.text :short_description, :size => (64.kilobytes + 1)
      t.text :full_description, :size => (64.kilobytes + 1)
      

      t.timestamps
    end
  end
end
