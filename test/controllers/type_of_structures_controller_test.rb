require 'test_helper'

class TypeOfStructuresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get type_of_structures_index_url
    assert_response :success
  end

  test "should get add" do
    get type_of_structures_add_url
    assert_response :success
  end

end
