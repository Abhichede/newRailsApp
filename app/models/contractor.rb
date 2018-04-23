class Contractor < ApplicationRecord
  belongs_to :site
  has_many :contractual_labours

  def total_amount_owe
    total_amount.to_f.round(2)
  end

  def total_amount_paid
    @outgoing_payments = OutgoingPayment.where(:payment_for => 'CONTRACTOR', :payment_for_id => id)

    total_paid_amount = 0

    @outgoing_payments.each do |op|
      total_paid_amount += op.amount.to_f.round(2)
    end

    total_paid_amount
  end
end
