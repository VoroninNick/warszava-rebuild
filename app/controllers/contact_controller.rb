class ContactController < ApplicationController
  def index
    @title = 'Контакти //Готель львів//Готель варшава//Готелі львова//Львів готель'
    @meta_description = ''
    @meta_keywords = ''

    render template: 'contact/original_index'
  end

  def create_message
    @title = 'Контакти //Готель львів//Готель варшава//Готелі львова//Львів готель'
    @meta_description = ''
    @meta_keywords = ''

    order = Order.create
    order.name = params['email_message']['user_name']
    order.phone = params['email_message']['user_phone']
    order.email = params['email_message']['user_mail']
    order.message = params['email_message']['user_msg']
    order.save

    #render inline: params.inspect

    OrderMailer.create_message(order).deliver

    if !params['ajax']

      render template: 'contact/original_index'
    else
      render inline: 'ok'
    end
  end
end
