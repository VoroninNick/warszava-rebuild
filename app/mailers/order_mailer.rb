class OrderMailer < ActionMailer::Base
  default from: "support@voroninstudio.eu"



  def create_message(order)
    order_form = FormConfig.first
    receivers = order_form.receiver_list
    @order = order

    template_name = "mailers/order_mailer/message"
    template_name = "mailers/order_mailer/room" if @order.is_a?(RoomOrder)


    mail(to: receivers, template_name: template_name, template_path: '')
  end
end
