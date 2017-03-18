require 'test_helper'

class UserAuthenticationsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get user_authentications_create_url
    assert_response :success
  end

end
