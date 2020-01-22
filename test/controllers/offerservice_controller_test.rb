require 'test_helper'

class OfferserviceControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get offerservice_index_url
    assert_response :success
  end

end
