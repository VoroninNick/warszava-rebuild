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

  translates :text_under_slider, :quote, :text
  accepts_nested_attributes_for :translations
  attr_accessible :translations, :translations_attributes

  class Translation
    attr_accessible :locale, :text_under_slider, :quote, :text

    rails_admin do
      edit do
        field :locale, :hidden
        field :text_under_slider
        field :quote
        field :text
      end
    end
  end

  rails_admin do
    edit do
      field :translations, :globalize_tabs
    end
  end

end
