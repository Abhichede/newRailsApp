require 'test_helper'

class MaterialListControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get material_list_index_url
    assert_response :success
  end

  test "should get show" do
    get material_list_show_url
    assert_response :success
  end

  test "should get add" do
    get material_list_add_url
    assert_response :success
  end

end
