require 'test_helper'

class SermonSeriesControllerTest < ActionController::TestCase
  setup do
    @sermon_series = sermon_series(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sermon_series)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sermon_series" do
    assert_difference('SermonSeries.count') do
      post :create, sermon_series: { banner_image: @sermon_series.banner_image, button_image: @sermon_series.button_image, current_series: @sermon_series.current_series, description: @sermon_series.description, end_date: @sermon_series.end_date, start_date: @sermon_series.start_date, title: @sermon_series.title }
    end

    assert_redirected_to sermon_series_path(assigns(:sermon_series))
  end

  test "should show sermon_series" do
    get :show, id: @sermon_series
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sermon_series
    assert_response :success
  end

  test "should update sermon_series" do
    put :update, id: @sermon_series, sermon_series: { banner_image: @sermon_series.banner_image, button_image: @sermon_series.button_image, current_series: @sermon_series.current_series, description: @sermon_series.description, end_date: @sermon_series.end_date, start_date: @sermon_series.start_date, title: @sermon_series.title }
    assert_redirected_to sermon_series_path(assigns(:sermon_series))
  end

  test "should destroy sermon_series" do
    assert_difference('SermonSeries.count', -1) do
      delete :destroy, id: @sermon_series
    end

    assert_redirected_to sermon_series_index_path
  end
end
