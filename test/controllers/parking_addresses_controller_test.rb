require 'test_helper'

class ParkingAddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @parking_address = parking_addresses(:one)
  end

  test "should get index" do
    get parking_addresses_url
    assert_response :success
  end

  test "should get new" do
    get new_parking_address_url
    assert_response :success
  end

  test "should create parking_address" do
    assert_difference('ParkingAddress.count') do
      post parking_addresses_url, params: { parking_address: { additionalDetails: @parking_address.additionalDetails, address: @parking_address.address, approval: @parking_address.approval, availableFrom: @parking_address.availableFrom, building: @parking_address.building, city: @parking_address.city, country: @parking_address.country, dailyRate: @parking_address.dailyRate, features: @parking_address.features, hourlyRate: @parking_address.hourlyRate, monthlyRate: @parking_address.monthlyRate, postcode: @parking_address.postcode, state: @parking_address.state, status: @parking_address.status, user_id: @parking_address.user_id, weeklyRate: @parking_address.weeklyRate, xCoordinates: @parking_address.xCoordinates, yCoordinate: @parking_address.yCoordinate } }
    end

    assert_redirected_to parking_address_url(ParkingAddress.last)
  end

  test "should show parking_address" do
    get parking_address_url(@parking_address)
    assert_response :success
  end

  test "should get edit" do
    get edit_parking_address_url(@parking_address)
    assert_response :success
  end

  test "should update parking_address" do
    patch parking_address_url(@parking_address), params: { parking_address: { additionalDetails: @parking_address.additionalDetails, address: @parking_address.address, approval: @parking_address.approval, availableFrom: @parking_address.availableFrom, building: @parking_address.building, city: @parking_address.city, country: @parking_address.country, dailyRate: @parking_address.dailyRate, features: @parking_address.features, hourlyRate: @parking_address.hourlyRate, monthlyRate: @parking_address.monthlyRate, postcode: @parking_address.postcode, state: @parking_address.state, status: @parking_address.status, user_id: @parking_address.user_id, weeklyRate: @parking_address.weeklyRate, xCoordinates: @parking_address.xCoordinates, yCoordinate: @parking_address.yCoordinate } }
    assert_redirected_to parking_address_url(@parking_address)
  end

  test "should destroy parking_address" do
    assert_difference('ParkingAddress.count', -1) do
      delete parking_address_url(@parking_address)
    end

    assert_redirected_to parking_addresses_url
  end
end
