require 'test_helper'

class SessionssControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get sessionss_create_url
    assert_response :success
  end

  test "should get destroy" do
    get sessionss_destroy_url
    assert_response :success
  end

end
