require "application_system_test_case"

class DentistsTest < ApplicationSystemTestCase
  setup do
    @dentist = dentists(:one)
  end

  test "visiting the index" do
    visit dentists_url
    assert_selector "h1", text: "Dentists"
  end

  test "should create dentist" do
    visit dentists_url
    click_on "New dentist"

    fill_in "Name", with: @dentist.name
    fill_in "Registered since", with: @dentist.registered_since
    check "Registration status" if @dentist.registration_status
    click_on "Create Dentist"

    assert_text "Dentist was successfully created"
    click_on "Back"
  end

  test "should update Dentist" do
    visit dentist_url(@dentist)
    click_on "Edit this dentist", match: :first

    fill_in "Name", with: @dentist.name
    fill_in "Registered since", with: @dentist.registered_since
    check "Registration status" if @dentist.registration_status
    click_on "Update Dentist"

    assert_text "Dentist was successfully updated"
    click_on "Back"
  end

  test "should destroy Dentist" do
    visit dentist_url(@dentist)
    click_on "Destroy this dentist", match: :first

    assert_text "Dentist was successfully destroyed"
  end
end
