require "test_helper"

class ApplicationFormsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get application_forms_new_url
    assert_response :success
  end

  test "should get create" do
    get application_forms_create_url
    assert_response :success
  end
end
