class Service < ActiveRecord::Base
  #acts_as_content_block
  #has_many_attachments :images, :styles => { :home => "216x90#", :miniser => "145x96#", :bigser => "420x279#", :last_img => "337x97#", :big => "800x600#", :thumb => "100x100#" }

  attr_accessible :display_home, :name, :short_description, :full_description, :avatar

  attr_accessible :published, :deleted, :archived, :created_by, :updated_by, :version, :lock_version

  translates :name, :short_description, :full_description
  accepts_nested_attributes_for :translations
  attr_accessible :translations, :translations_attributes

  mount_uploader :avatar, ServiceAvatarUploader
  attr_accessible :remove_avatar, :avatar_cache

  has_many :service_gallery_images
  attr_accessible :service_gallery_images
  accepts_nested_attributes_for :service_gallery_images
  attr_accessible :service_gallery_images_attributes

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
    edit do
      field :display_home
      field :published
      field :avatar
      #field :deleted
      #field :archived
      #field :created_by
      #field :updated_by
      #field :version
      #field :lock_version

      field :translations, :globalize_tabs
      field :service_gallery_images
    end

    list do
      field :display_home
      field :published
      field :name
      field :short_description
      field :avatar
      field :full_description
    end
  end
end
