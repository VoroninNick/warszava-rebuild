class Page < ActiveRecord::Base
  self.table_name = 'vs_pages'

  belongs_to :custom_page, polymorphic: true

  attr_accessible :custom_page
  attr_accessible :page, :name, :path, :meta_description, :meta_keywords, :head_title, :controller, :action

  has_one :sitemap_record
  accepts_nested_attributes_for :sitemap_record
  attr_accessible :sitemap_record, :sitemap_record_attributes

  has_many :html_blocks, as: :page

  after_save :reload_routes_after_save
  after_destroy :reload_routes_after_destroy

  def reload_routes_after_destroy
    DynamicRouter.reload
  end

  def reload_routes_after_save

    counter = 0
    if new_record? || controller_changed? || action_changed?
      counter = 1
    else
      self.translations.each do |t|
        if t.path_changed? == true
          counter = 1
          break
        end
      end
    end

    if counter > 0
      DynamicRouter.reload
    end
  end


  translates :path, :meta_description, :meta_keywords, :head_title
  accepts_nested_attributes_for :translations
  attr_accessible :translations, :translations_attributes

  class Translation
    attr_accessible :locale, :path, :meta_description, :meta_keywords, :head_title

    rails_admin do
      edit do

      end

      nested do
        field :locale, :hidden
        field :path
        field :head_title
        field :meta_keywords
        field :meta_description

      end
    end
  end

  rails_admin do
    edit do
      field :name
      field :translations, :globalize_tabs
      group :advanced do
        active false
        field :controller
        field :action
      end
    end

    list do
      field :name
      field :path
    end
  end
end
