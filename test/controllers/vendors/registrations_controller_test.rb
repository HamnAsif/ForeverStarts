require "test_helper"

class Vendors::RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get vendors_registrations_new_url
    assert_response :success
  end

  test "should get create" do
    get vendors_registrations_create_url
    assert_response :success
  end
end
