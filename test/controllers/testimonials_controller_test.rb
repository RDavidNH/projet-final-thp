require 'test_helper'

class TestimonialsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get testimonials_create_url
    assert_response :success
  end

  test "should get update" do
    get testimonials_update_url
    assert_response :success
  end

end
