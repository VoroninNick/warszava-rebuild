class OrderController < ApplicationController
  def order_room_form
    @order_room_form_object = RoomOrder.new

    render layout: 'popup', template: 'order/order_room_form'
  end

  def order_room
    render layout: 'popup'
  end
end
