class Contractor < ApplicationRecord
  belongs_to :site
  has_many :contractual_labours, dependent: :destroy
  has_many :customer_documents, dependent: :destroy

  def outgoing_payments
    outgoing_payments = []
    contractual_labours.each do |labour|
      outgoing_payments << labour.outgoing_payments
    end
    outgoing_payments.flatten
  end
end
