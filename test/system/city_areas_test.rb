require "application_system_test_case"

class CityAreasTest < ApplicationSystemTestCase
  setup do
    @city_area = city_areas(:one)
  end

  test "visiting the index" do
    visit city_areas_url
    assert_selector "h1", text: "City Areas"
  end

  test "creating a City area" do
    visit city_areas_url
    click_on "New City Area"

    fill_in "Slug", with: @city_area.slug
    fill_in "Title", with: @city_area.title
    fill_in "User", with: @city_area.user_id
    click_on "Create City area"

    assert_text "City area was successfully created"
    click_on "Back"
  end

  test "updating a City area" do
    visit city_areas_url
    click_on "Edit", match: :first

    fill_in "Slug", with: @city_area.slug
    fill_in "Title", with: @city_area.title
    fill_in "User", with: @city_area.user_id
    click_on "Update City area"

    assert_text "City area was successfully updated"
    click_on "Back"
  end

  test "destroying a City area" do
    visit city_areas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "City area was successfully destroyed"
  end
end
