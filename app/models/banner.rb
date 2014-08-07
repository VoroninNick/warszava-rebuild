class Banner < ActiveRecord::Base
  #acts_as_content_block
  #has_many_attachments :images, :styles => {:big => "1152x521#", :thumb => "100x100#"}

  has_many :banner_images
  attr_accessible :banner_images, :banner_image_ids

  attr_accessible :published, :name

  rails_admin do
    field :published
    field :name
    #field :deleted
    #field :archived
    #field :created_by
    #field :updated_by
    #field :version
    #field :lock_version

    field :banner_images

    #field :translations, :globalize_tabs

    #field :page
  end
end
