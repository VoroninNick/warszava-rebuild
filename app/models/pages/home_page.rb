class Pages::HomePage < ActiveRecord::Base
  self.table_name = 'home_pages'

  has_one :page, as: :custom_page
end
