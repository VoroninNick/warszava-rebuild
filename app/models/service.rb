class Service < ActiveRecord::Base
  has_many :translations
  #acts_as_content_block
  #has_many_attachments :images, :styles => { :home => "216x90#", :miniser => "145x96#", :bigser => "420x279#", :last_img => "337x97#", :big => "800x600#", :thumb => "100x100#" }

  attr_accessible :display_home, :name, :short_description, :full_description, :avatar

  attr_accessible :published, :deleted, :archived, :created_by, :updated_by, :version, :lock_version

  #translates :name, :short_description, :full_description
  accepts_nested_attributes_for :translations
  attr_accessible :translations, :translations_attributes

  mount_uploader :avatar, ServiceAvatarUploader
  attr_accessible :remove_avatar, :avatar_cache

  has_many :service_gallery_images
  attr_accessible :service_gallery_images
  accepts_nested_attributes_for :service_gallery_images
  attr_accessible :service_gallery_images_attributes

  def self.restore
    Service.all.each {|s|  s.translations.each {|t|   t.full_description = s.full_description; ActiveRecord::Base.connection.execute(("update ".encode('UTF-8')+ Service.translation_class.table_name.encode('UTF-8') + " set full_description=\"".encode('UTF-8') + s.full_description.encode('UTF-8') + "\" where id = ".encode('UTF-8') + t.id.to_s.encode('UTF-8')).encode('UTF-8') )  } }
  end

  def self.simple_restore
    Service.all.each {|s|  s.translations.each {|t|   t.full_description = s.full_description; t.save  } }
  end

  class Translation < ActiveRecord::Base
    self.table_name = "service_translations"

    attr_accessible :locale, :name, :short_description, :full_description
    belongs_to :service

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
