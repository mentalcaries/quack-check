require "test_helper"

class DentistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dentist = dentists(:one)
  end

  test "should get index" do
    get dentists_url
    assert_response :success
  end

  test "should get new" do
    get new_dentist_url
    assert_response :success
  end

  test "should create dentist" do
    assert_difference("Dentist.count") do
      post dentists_url, params: { dentist: { name: @dentist.name, registered_since: @dentist.registered_since, registration_status: @dentist.registration_status } }
    end

    assert_redirected_to dentist_url(Dentist.last)
  end

  test "should show dentist" do
    get dentist_url(@dentist)
    assert_response :success
  end

  test "should get edit" do
    get edit_dentist_url(@dentist)
    assert_response :success
  end

  test "should update dentist" do
    patch dentist_url(@dentist), params: { dentist: { name: @dentist.name, registered_since: @dentist.registered_since, registration_status: @dentist.registration_status } }
    assert_redirected_to dentist_url(@dentist)
  end

  test "should destroy dentist" do
    assert_difference("Dentist.count", -1) do
      delete dentist_url(@dentist)
    end

    assert_redirected_to dentists_url
  end
end
