require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get itjobs" do
    get pages_itjobs_url
    assert_response :success
  end
end
