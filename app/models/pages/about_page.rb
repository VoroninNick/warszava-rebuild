class Pages::AboutPage < ActiveRecord::Base
  self.table_name = 'about_pages'

  has_one :page, as: :custom_page
  accepts_nested_attributes_for :page
  attr_accessible :page, :page_attributes

end
