require 'test_helper'

class SiteControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get visit" do
    get :visit
    assert_response :success
  end

  test "should get god" do
    get :god
    assert_response :success
  end

  test "should get connect" do
    get :connect
    assert_response :success
  end

  test "should get identity" do
    get :identity
    assert_response :success
  end

end
