require "test_helper"

class NeighborhoodTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "neighborhood must have name" do
    neighborhood = Neighborhood.new()
    assert neighborhood.invalid?
    assert neighborhood.errors[:name].any?
  end

end
