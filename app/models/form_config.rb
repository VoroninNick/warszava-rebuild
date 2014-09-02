class FormConfig < ActiveRecord::Base
  attr_accessible :name

  acts_as_taggable_on :receivers

  attr_accessible :receivers, :receiver_list

  rails_admin do
    edit do
      field :name

      field :receiver_list do
        partial 'tag_list_with_suggestions'
      end
    end
  end


end
