class OrderController < ApplicationController
  def order_room_form
    @order_room_form_object = RoomOrder.new

    @is_specified_room = params[:id].to_i >= 1

    if !@is_specified_room
      @available_rooms = Room.where(published: 't').order('id desc')
    end

    render layout: 'popup', template: 'order/order_room_form'
  end

  def order_room
    render layout: 'popup'
  end
end
