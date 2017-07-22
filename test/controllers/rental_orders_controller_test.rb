require 'test_helper'

class RentalOrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rental_order = rental_orders(:one)
  end

  test "should get index" do
    get rental_orders_url
    assert_response :success
  end

  test "should get new" do
    get new_rental_order_url
    assert_response :success
  end

  test "should create rental_order" do
    assert_difference('RentalOrder.count') do
      post rental_orders_url, params: { rental_order: { orderTotal: @rental_order.orderTotal, parking_address_id: @rental_order.parking_address_id, rentEnd: @rental_order.rentEnd, rentStart: @rental_order.rentStart, status: @rental_order.status, user_id: @rental_order.user_id } }
    end

    assert_redirected_to rental_order_url(RentalOrder.last)
  end

  test "should show rental_order" do
    get rental_order_url(@rental_order)
    assert_response :success
  end

  test "should get edit" do
    get edit_rental_order_url(@rental_order)
    assert_response :success
  end

  test "should update rental_order" do
    patch rental_order_url(@rental_order), params: { rental_order: { orderTotal: @rental_order.orderTotal, parking_address_id: @rental_order.parking_address_id, rentEnd: @rental_order.rentEnd, rentStart: @rental_order.rentStart, status: @rental_order.status, user_id: @rental_order.user_id } }
    assert_redirected_to rental_order_url(@rental_order)
  end

  test "should destroy rental_order" do
    assert_difference('RentalOrder.count', -1) do
      delete rental_order_url(@rental_order)
    end

    assert_redirected_to rental_orders_url
  end
end
