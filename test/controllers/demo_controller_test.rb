require 'test_helper'

class DemoControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get api" do
    get :api
    assert_response :success
  end

  test "should get oauth" do
    get :oauth
    assert_response :success
  end

end
