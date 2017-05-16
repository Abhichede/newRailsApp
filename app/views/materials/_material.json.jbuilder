json.extract! material, :id, :date, :name_of_supplier, :supplier_id, :site_id, :type_of_material, :quantity, :unit, :challan_no, :truck_no, :time, :rate, :amount, :supervisor_name, :created_at, :updated_at
json.url material_url(material, format: :json)
