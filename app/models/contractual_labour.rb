class ContractualLabour < ApplicationRecord
  belongs_to :site
  belongs_to :contractor

  def outgoing_payments
    OutgoingPayment.where(:payment_for => 'CONTRACTOR', :payment_for_id => id).order("created_at DESC").map(&:serializable_hash)
  end
end
