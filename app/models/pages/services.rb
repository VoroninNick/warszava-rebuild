class Pages::Services < ActiveRecord::Base
  self.table_name = 'services_page'

  attr_accessible :intro

  translates :intro
  accepts_nested_attributes_for :translations
  attr_accessible :translations, :translations_attributes

  class Translation
    attr_accessible :locale, :intro

    rails_admin do
      edit do
        field :locale, :hidden
        field :intro, :ck_editor
      end
    end
  end

  rails_admin do
    edit do
      field :translations, :globalize_tabs
    end
  end
end
