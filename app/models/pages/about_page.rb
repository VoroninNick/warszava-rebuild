class Pages::AboutPage < ActiveRecord::Base
  self.table_name = 'about_pages'

  has_one :page, as: :custom_page
  accepts_nested_attributes_for :page
  attr_accessible :page, :page_attributes

  attr_accessible :text_under_slider, :quote, :text

  has_many :about_page_gallery_images
  attr_accessible :about_page_gallery_images
  accepts_nested_attributes_for :about_page_gallery_images
  attr_accessible :about_page_gallery_images_attributes

end
