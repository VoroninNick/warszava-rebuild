class AddFieldsToAboutHotelPage < ActiveRecord::Migration
  def change
    add_column :about_pages, :text_under_slider, :text
    add_column :about_pages, :quote, :text
    add_column :about_pages, :text, :text
  end
end
