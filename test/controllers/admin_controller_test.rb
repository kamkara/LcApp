require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_index_url
    assert_response :success
  end

  test "should get create" do
    get admin_create_url
    assert_response :success
  end

  test "should get dashbaord" do
    get admin_dashbaord_url
    assert_response :success
  end

  test "should get table" do
    get admin_table_url
    assert_response :success
  end
end
