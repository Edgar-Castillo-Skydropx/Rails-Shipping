require "application_system_test_case"

class CarriersTest < ApplicationSystemTestCase
  setup do
    @carrier = carriers(:one)
  end

  test "visiting the index" do
    visit carriers_url
    assert_selector "h1", text: "Carriers"
  end

  test "should create carrier" do
    visit carriers_url
    click_on "New carrier"

    fill_in "Country", with: @carrier.country
    fill_in "Name", with: @carrier.name
    fill_in "Service", with: @carrier.service
    click_on "Create Carrier"

    assert_text "Carrier was successfully created"
    click_on "Back"
  end

  test "should update Carrier" do
    visit carrier_url(@carrier)
    click_on "Edit this carrier", match: :first

    fill_in "Country", with: @carrier.country
    fill_in "Name", with: @carrier.name
    fill_in "Service", with: @carrier.service
    click_on "Update Carrier"

    assert_text "Carrier was successfully updated"
    click_on "Back"
  end

  test "should destroy Carrier" do
    visit carrier_url(@carrier)
    click_on "Destroy this carrier", match: :first

    assert_text "Carrier was successfully destroyed"
  end
end
