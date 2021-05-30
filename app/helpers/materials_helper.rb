module MaterialsHelper
  ActionView::Helpers::NumberHelper
  def get_quantity site, type
    quantity = 0
    total_amount = 0
    site.materials.where(type_of_material: type).each do |material_quantity|
      quantity += material_quantity.quantity.to_f
      total_amount += material_quantity.amount.to_f
    end
    total_amount = number_to_currency(total_amount, unit: "₹", precision: 2, delimiter: ',')
    return quantity, total_amount
  end
end
