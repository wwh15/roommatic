require "test_helper"

class CityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "city name has to exist" do
    city = City.new()
    assert city.invalid?
    assert city.errors[:name].any?
  end

  test "city names cannot be duplicate" do
    lexington = cities(:lexington)
    duplicate_city = City.new(name: lexington.name)
    assert duplicate_city.invalid?
    assert duplicate_city.errors.of_kind? :name, :taken
  end

end
