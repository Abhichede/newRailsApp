json.extract! office_expence, :id, :date, :description, :amount, :payment_to, :payment_method, :payment_desc, :paid_by, :deleting_status, :created_at, :updated_at
json.url office_expence_url(office_expence, format: :json)
