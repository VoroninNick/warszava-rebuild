class Page < ActiveRecord::Base
  self.table_name = 'vs_pages'

  belongs_to :custom_page, polymorphic: true

  attr_accessible :custom_page
  attr_accessible :page, :path, :meta_description, :meta_keywords, :head_title, :controller, :action

  has_one :sitemap_record
  accepts_nested_attributes_for :sitemap_record
  attr_accessible :sitemap_record, :sitemap_record_attributes

  has_many :html_blocks, as: :page
end
