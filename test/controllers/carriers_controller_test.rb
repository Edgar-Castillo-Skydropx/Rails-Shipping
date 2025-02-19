require "test_helper"

class CarriersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @carrier = carriers(:one)
  end

  test "should get index" do
    get carriers_url
    assert_response :success
  end

  test "should get new" do
    get new_carrier_url
    assert_response :success
  end

  test "should create carrier" do
    assert_difference("Carrier.count") do
      post carriers_url, params: { carrier: { country: @carrier.country, name: @carrier.name, service: @carrier.service } }
    end

    assert_redirected_to carrier_url(Carrier.last)
  end

  test "should show carrier" do
    get carrier_url(@carrier)
    assert_response :success
  end

  test "should get edit" do
    get edit_carrier_url(@carrier)
    assert_response :success
  end

  test "should update carrier" do
    patch carrier_url(@carrier), params: { carrier: { country: @carrier.country, name: @carrier.name, service: @carrier.service } }
    assert_redirected_to carrier_url(@carrier)
  end

  test "should destroy carrier" do
    assert_difference("Carrier.count", -1) do
      delete carrier_url(@carrier)
    end

    assert_redirected_to carriers_url
  end
end
