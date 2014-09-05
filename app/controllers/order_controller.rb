class OrderController < ApplicationController
  def order_room_form
    @order_room_form_object = RoomOrder.new

    @is_specified_room = params[:id].to_i >= 1
    @specified_room = Room.where(id: params[:id])
    if @specified_room.respond_to?(:first) && @specified_room.respond_to?(:count) && @specified_room.count > 0
      @specified_room = @specified_room.first
    else
      @specified_room = nil
    end

    if !@is_specified_room || true
      @available_rooms = Room.where(published: 't').order('id desc')
    end

    render layout: 'popup', template: 'order/order_room_form'
  end

  def order_room
    render layout: 'popup'
  end
end
