class HtmlBlock < ActiveRecord::Base
  attr_accessible :id, :version, :lock_version, :name, :content, :published, :deleted, :archived, :created_by_id, :updated_by_id, :created_at, :updated_at


  belongs_to :page, polymorphic: true

  translates :name, :content
  accepts_nested_attributes_for :translations
  attr_accessible :translations, :translations_attributes

  class Translation
    attr_accessible :locale, :name, :content

    rails_admin do
      edit do

      end

      nested do
        field :locale, :hidden
        field :name
        field :content

      end
    end
  end

  rails_admin do
    field :published
    #field :deleted
    #field :archived
    #field :created_by
    #field :updated_by
    #field :version
    #field :lock_version

    field :translations, :globalize_tabs
  end
end