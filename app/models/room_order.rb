class RoomOrder < ActiveRecord::Base
  belongs_to :room

  attr_accessible :room, :room_id, :name, :email, :phone, :message

end
