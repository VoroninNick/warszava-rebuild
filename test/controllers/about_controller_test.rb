require 'test_helper'

class AboutControllerTest < ActionController::TestCase
  test "should get hotel" do
    get :hotel
    assert_response :success
  end

  test "should get restaurant" do
    get :restaurant
    assert_response :success
  end

end
