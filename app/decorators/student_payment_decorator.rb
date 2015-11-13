class StudentPaymentDecorator < BaseDecorator
  NOT_PAID = 'not paid'.freeze

  def formatted_payment_date
    (payment_date || NOT_PAID).to_s
  end
end
