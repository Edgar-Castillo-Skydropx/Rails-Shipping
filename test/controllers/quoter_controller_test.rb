require "test_helper"

class QuoterControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get quoter_home_url
    assert_response :success
  end
end
