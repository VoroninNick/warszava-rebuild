require 'test_helper'

class OrderControllerTest < ActionController::TestCase
  test "should get order_room" do
    get :order_room
    assert_response :success
  end

end
