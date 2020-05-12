require 'test_helper'

class AvatorsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get avators_new_url
    assert_response :success
  end

end
