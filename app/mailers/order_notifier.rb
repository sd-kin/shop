class OrderNotifier < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #
  default from: 'Shop'
  def received(order)
    @order = order

     mail to: order.email, subject: 'Order confirmation' 
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.shipped.subject
  #
  def shipped
    @order = order

    mail to: order.email, subject: 'Order shipped' 
  end
end
