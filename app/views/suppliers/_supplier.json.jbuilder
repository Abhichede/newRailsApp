json.extract! supplier, :id, :name, :address, :email, :contact_number, :contact_person, :created_at, :updated_at
json.url supplier_url(supplier, format: :json)
