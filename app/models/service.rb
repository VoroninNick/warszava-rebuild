class Service < ActiveRecord::Base
  #acts_as_content_block
  #has_many_attachments :images, :styles => { :home => "216x90#", :miniser => "145x96#", :bigser => "420x279#", :last_img => "337x97#", :big => "800x600#", :thumb => "100x100#" }

  attr_accessible :display_home, :name, :short_description, :full_description

  attr_accessible :published, :deleted, :archived, :created_by, :updated_by, :version, :lock_version

  translates :name, :short_description, :full_description
  accepts_nested_attributes_for :translations
  attr_accessible :translations, :translations_attributes

  class Translation
    attr_accessible :locale, :name, :short_description, :full_description

    rails_admin do
      edit do

      end

      nested do
        field :locale, :hidden
        field :name
        field :short_description
        field :full_description
      end
    end
  end

  rails_admin do
    field :display_home
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
