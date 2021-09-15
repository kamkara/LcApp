require "test_helper"

class PartnerControllerTest < ActionDispatch::IntegrationTest
  test "should get team" do
    get partner_team_url
    assert_response :success
  end

  test "should get partner" do
    get partner_partner_url
    assert_response :success
  end
end
