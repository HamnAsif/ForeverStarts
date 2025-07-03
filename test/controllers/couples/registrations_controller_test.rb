require "test_helper"

class Couples::RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get couples_registrations_new_url
    assert_response :success
  end

  test "should get create" do
    get couples_registrations_create_url
    assert_response :success
  end
end
