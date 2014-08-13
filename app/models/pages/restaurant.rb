class Pages::Restaurant < ActiveRecord::Base
  self.table_name = 'restaurant_page'

  attr_accessible :content

  translates :content
  accepts_nested_attributes_for :translations
  attr_accessible :translations, :translations_attributes

  class Translation
    attr_accessible :locale, :content

    rails_admin do
      edit do
        field :locale, :hidden
        field :content, :ck_editor
      end
    end
  end

  rails_admin do
    edit do
      field :translations, :globalize_tabs
    end
  end
end
