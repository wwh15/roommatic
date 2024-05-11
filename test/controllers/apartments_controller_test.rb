require "test_helper"

class ApartmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    login_as users(:one)
    @apartment = apartments(:home)
  end

  test "should get index" do
    get apartments_url
    assert_response :success
  end

  test "should get new" do
    get new_apartment_url
    assert_response :success
  end

  test "should create apartment" do
    assert_difference("Apartment.count") do
      post apartments_url, params: { apartment: { bedrooms: @apartment.bedrooms, city_id: @apartment.city_id, neighborhood_id: @apartment.neighborhood_id, notes: @apartment.notes, rent: @apartment.rent, street_address: @apartment.street_address } }
    end

    assert_redirected_to apartment_url(Apartment.last)
  end

  test "should show apartment" do
    get apartment_url(@apartment)
    assert_response :success
  end

  test "should get edit" do
    get edit_apartment_url(@apartment)
    assert_response :success
  end

  test "should update apartment" do
    patch apartment_url(@apartment), params: { apartment: { bedrooms: @apartment.bedrooms, city_id: @apartment.city_id, neighborhood_id: @apartment.neighborhood_id, notes: @apartment.notes, rent: @apartment.rent, street_address: @apartment.street_address } }
    assert_redirected_to apartment_url(@apartment)
  end

  test "should destroy apartment" do
    assert_difference("Apartment.count", -1) do
      delete apartment_url(@apartment)
    end

    assert_redirected_to apartments_url
  end
end
