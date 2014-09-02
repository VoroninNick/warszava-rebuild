class OrderMailer < ActionMailer::Base
  default from: "support@voroninstudio.eu"



  def create_message(order)
    order_form = FormConfig.first
    receivers = order_form.receiver_list
    @order = order
    mail(to: receivers, template_name: 'mailers/order_mailer/message', template_path: '')
  end
end
