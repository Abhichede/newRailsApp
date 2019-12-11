class Partner < ApplicationRecord
  has_many :partner_payments

  def debits
    partner_payments.where(payment_type: 'DEBIT').order('created_at DESC')
  end

  def credit
    partner_payments.where(payment_type: 'CREDIT').order('created_at DESC')
  end
end
