require 'test_helper'

class CarDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @car_detail = car_details(:one)
  end

  test "should get index" do
    get car_details_url
    assert_response :success
  end

  test "should get new" do
    get new_car_detail_url
    assert_response :success
  end

  test "should create car_detail" do
    assert_difference('CarDetail.count') do
      post car_details_url, params: { car_detail: { carRegistrationNumber: @car_detail.carRegistrationNumber, color: @car_detail.color, manufacturer: @car_detail.manufacturer, model: @car_detail.model, roadTaxNumber: @car_detail.roadTaxNumber, user_id: @car_detail.user_id } }
    end

    assert_redirected_to car_detail_url(CarDetail.last)
  end

  test "should show car_detail" do
    get car_detail_url(@car_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_car_detail_url(@car_detail)
    assert_response :success
  end

  test "should update car_detail" do
    patch car_detail_url(@car_detail), params: { car_detail: { carRegistrationNumber: @car_detail.carRegistrationNumber, color: @car_detail.color, manufacturer: @car_detail.manufacturer, model: @car_detail.model, roadTaxNumber: @car_detail.roadTaxNumber, user_id: @car_detail.user_id } }
    assert_redirected_to car_detail_url(@car_detail)
  end

  test "should destroy car_detail" do
    assert_difference('CarDetail.count', -1) do
      delete car_detail_url(@car_detail)
    end

    assert_redirected_to car_details_url
  end
end
