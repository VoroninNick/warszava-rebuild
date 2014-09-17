class Room < ActiveRecord::Base
  #acts_as_content_block
  #has_many_attachments :images, :styles => { :home => "216x90#", :miniser => "145x96#", :bigser => "420x279#", :last_img => "337x97#", :big => "800x600#", :thumb => "100x100#" }

  has_many :room_orders
  attr_accessible :room_orders

  attr_accessible :name, :full_description
  attr_accessible :published, :deleted, :archived, :created_by, :updated_by, :version, :lock_version
  attr_accessible :quantity, :price_per_night, :extra_bed_price

  attr_accessible :avatar
  mount_uploader :avatar, RoomAvatarUploader
  attr_accessible :remove_avatar, :avatar_cache

  has_many :room_gallery_images
  attr_accessible :room_gallery_images
  accepts_nested_attributes_for :room_gallery_images
  attr_accessible :room_gallery_images_attributes





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
      field :avatar

      #field :deleted
      #field :archived
      #field :created_by
      #field :updated_by
      #field :version
      #field :lock_version

      field :translations, :globalize_tabs
      field :room_gallery_images

      field :room_orders

      field :quantity
      field :price_per_night
      field :extra_bed_price
    end

    list do
      field :published
      field :name
      field :full_description



    end
  end
end
