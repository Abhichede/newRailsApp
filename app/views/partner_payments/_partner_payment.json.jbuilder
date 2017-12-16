json.extract! partner_payment, :id, :payment_type, :date, :amount, :payment_method, :payment_desc, :created_at, :updated_at
json.url partner_payment_url(partner_payment, format: :json)
