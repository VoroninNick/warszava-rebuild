class Article < ActiveRecord::Base
  #acts_as_content_block
  #has_many_attachments :avatars, :styles => { :ava => "140x90#", :thumb => "100x100#", :preview => "440x440#" }

  has_one :page, as: :custom_page
  accepts_nested_attributes_for :page
  attr_accessible :page, :page_attributes

  attr_accessible :name, :description, :short_descr
  attr_accessible :published, :deleted, :archived, :created_by, :updated_by, :version, :lock_version

  translates :name, :short_descr, :description
  accepts_nested_attributes_for :translations
  attr_accessible :translations, :translations_attributes

  class Translation
    attr_accessible :locale, :name, :short_descr, :description

    rails_admin do
      edit do

      end

      nested do
        field :locale, :hidden
        field :name
        field :short_descr
        field :description

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

    field :page
  end

end
