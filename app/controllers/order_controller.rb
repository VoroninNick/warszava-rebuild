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

    #render layout: 'popup', template: 'order/order_room_form'
    render layout: 'ajax', template: 'order/order_room_form'
  end

  def order_room

    order = RoomOrder.create
    rooms_order_param = params['room_order']
    order.name = rooms_order_param['name']
    order.phone = rooms_order_param['phone']
    order.email = rooms_order_param['email']
    order.message = rooms_order_param['message']



    order.room = Room.find(params['room_id']) if rooms_order_param['room']
    order.save

    OrderMailer.create_message(order).deliver

    if !params['ajax']
      #render template: 'contact/original_index'
    else
      render inline: 'ok'
    end
  end
end
