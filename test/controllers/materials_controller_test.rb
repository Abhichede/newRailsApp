require 'test_helper'

class MaterialsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @material = materials(:one)
  end

  test "should get index" do
    get materials_url
    assert_response :success
  end

  test "should get new" do
    get new_material_url
    assert_response :success
  end

  test "should create material" do
    assert_difference('Material.count') do
      post materials_url, params: { material: { amount: @material.amount, challan_no: @material.challan_no, date: @material.date, name_of_supplier: @material.name_of_supplier, quantity: @material.quantity, rate: @material.rate, site_id: @material.site_id, supervisor_name: @material.supervisor_name, supplier_id: @material.supplier_id, time: @material.time, truck_no: @material.truck_no, type_of_material: @material.type_of_material, unit: @material.unit } }
    end

    assert_redirected_to material_url(Material.last)
  end

  test "should show material" do
    get material_url(@material)
    assert_response :success
  end

  test "should get edit" do
    get edit_material_url(@material)
    assert_response :success
  end

  test "should update material" do
    patch material_url(@material), params: { material: { amount: @material.amount, challan_no: @material.challan_no, date: @material.date, name_of_supplier: @material.name_of_supplier, quantity: @material.quantity, rate: @material.rate, site_id: @material.site_id, supervisor_name: @material.supervisor_name, supplier_id: @material.supplier_id, time: @material.time, truck_no: @material.truck_no, type_of_material: @material.type_of_material, unit: @material.unit } }
    assert_redirected_to material_url(@material)
  end

  test "should destroy material" do
    assert_difference('Material.count', -1) do
      delete material_url(@material)
    end

    assert_redirected_to materials_url
  end
end
