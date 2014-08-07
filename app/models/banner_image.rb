class BannerImage < ActiveRecord::Base
  attr_accessible :image
  mount_uploader :image, BannerImageUploader

  belongs_to :banner

  attr_accessible :banner, :banner_id

  rails_admin do
    edit do
      field :image
      field :banner
    end
  end

end
