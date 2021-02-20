class Partner < ApplicationRecord
  has_many :partner_payments, dependent: :destroy

  def debits
    partner_payments.where(payment_type: 'DEBIT').order(date: :desc)
  end

  def credit
    partner_payments.where(payment_type: 'CREDIT').order(date: :desc)
  end
end
