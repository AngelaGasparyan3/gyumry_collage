require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get pages_home_url
    assert_response :success
  end

  test "should get about" do
    get pages_about_url
    assert_response :success
  end

  test "should get student_life" do
    get pages_student_life_url
    assert_response :success
  end

  test "should get admissions" do
    get pages_admissions_url
    assert_response :success
  end
end
