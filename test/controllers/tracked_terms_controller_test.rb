require 'test_helper'

class TrackedTermsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get tracked_terms_create_url
    assert_response :success
  end

  test "should get destroy" do
    get tracked_terms_destroy_url
    assert_response :success
  end

end
