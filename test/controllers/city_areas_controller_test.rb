require "test_helper"

class CityAreasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @city_area = city_areas(:one)
  end

  test "should get index" do
    get city_areas_url
    assert_response :success
  end

  test "should get new" do
    get new_city_area_url
    assert_response :success
  end

  test "should create city_area" do
    assert_difference('CityArea.count') do
      post city_areas_url, params: { city_area: { slug: @city_area.slug, title: @city_area.title, user_id: @city_area.user_id } }
    end

    assert_redirected_to city_area_url(CityArea.last)
  end

  test "should show city_area" do
    get city_area_url(@city_area)
    assert_response :success
  end

  test "should get edit" do
    get edit_city_area_url(@city_area)
    assert_response :success
  end

  test "should update city_area" do
    patch city_area_url(@city_area), params: { city_area: { slug: @city_area.slug, title: @city_area.title, user_id: @city_area.user_id } }
    assert_redirected_to city_area_url(@city_area)
  end

  test "should destroy city_area" do
    assert_difference('CityArea.count', -1) do
      delete city_area_url(@city_area)
    end

    assert_redirected_to city_areas_url
  end
end
