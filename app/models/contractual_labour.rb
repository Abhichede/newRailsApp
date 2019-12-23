class ContractualLabour < ApplicationRecord
  belongs_to :site
  belongs_to :contractor

  def outgoing_payments
    OutgoingPayment.where(:payment_for => 'CONTRACTOR', :payment_for_id => id).order("created_at DESC").map(&:serializable_hash)
  end

  def outgoing_payments_by_site site_id
    OutgoingPayment.where(:payment_for => 'CONTRACTOR', :payment_for_id => id, site_id: site_id).order("created_at DESC").map(&:serializable_hash)
  end
end
