require "test_helper"

class ContactMessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get contact_messages_create_url
    assert_response :success
  end
end
