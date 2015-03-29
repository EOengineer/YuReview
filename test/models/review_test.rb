require "test_helper"

describe Review do
  let(:review) { Review.new }

  it "must be valid" do
    review.must_be :valid?
  end
end
