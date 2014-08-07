class Vacancy < ActiveRecord::Base
  #acts_as_content_block
  #has_many_attachments :images
  #has_many_attachments :docs

  attr_accessible :name, :full_description
  attr_accessible :published, :deleted, :archived, :created_by, :updated_by, :version, :lock_version

  translates :name, :full_description
  accepts_nested_attributes_for :translations
  attr_accessible :translations, :translations_attributes

  class Translation
    attr_accessible :locale, :name, :full_description

    rails_admin do
      edit do

      end

      nested do
        field :locale, :hidden
        field :name
        field :full_description

      end
    end
  end

  rails_admin do
    edit do
      field :published
      #field :deleted
      #field :archived
      #field :created_by
      #field :updated_by
      #field :version
      #field :lock_version

      field :translations, :globalize_tabs
    end

    list do
      field :published
      field :name
      field :full_description
    end
  end
end
