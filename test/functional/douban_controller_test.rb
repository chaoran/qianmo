require 'test_helper'

class DoubanControllerTest < ActionController::TestCase
  test "should get search" do
    get :search
    assert_response :success
  end

  test "should get get" do
    get :get
    assert_response :success
  end

end
