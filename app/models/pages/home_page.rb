class Pages::HomePage < ActiveRecord::Base
  self.table_name = 'home_pages'

  has_one :page, as: :custom_page
  accepts_nested_attributes_for :page
  attr_accessible :page_attributes, :page

  attr_accessible :welcome_html

  has_many :home_gallery_images
  attr_accessible :home_gallery_images
  accepts_nested_attributes_for :home_gallery_images
  attr_accessible :home_gallery_images_attributes


  rails_admin do
    edit do
      field :welcome_html, :ck_editor
      field :home_gallery_images
      field :page
    end
  end
end
