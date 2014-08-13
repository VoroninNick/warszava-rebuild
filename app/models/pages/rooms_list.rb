class Pages::RoomsList < ActiveRecord::Base
  self.table_name = 'rooms_list_page'

  has_one :page, as: :custom_page
  accepts_nested_attributes_for :page
  attr_accessible :page, :page_attributes

  attr_accessible :intro_text

  translates :intro_text
  accepts_nested_attributes_for :translations
  attr_accessible :translations, :translations_attributes

  class Translation
    attr_accessible :locale, :intro_text

    rails_admin do
      edit do

      end

      nested do
        field :locale, :hidden
        field :intro_text

      end
    end
  end

  rails_admin do
    edit do
      field :translations, :globalize_tabs

      field :page
    end
  end
end
