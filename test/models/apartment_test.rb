require "test_helper"

class ApartmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "apartments need to have street address" do
    apartment = Apartment.new()
    assert apartment.invalid?
    assert apartment.errors[:street_address].any?
  end
  
  test "apartment rent must be greater than 100" do
    apartment = Apartment.new(rent: 80)
    assert apartment.invalid?
    assert apartment.errors[:rent].any?
  end

  test "apartment must have at least one bedroom" do
    apartment = Apartment.new(bedrooms: 0)
    assert apartment.invalid?
    assert apartment.errors[:bedrooms].any?
  end

end
