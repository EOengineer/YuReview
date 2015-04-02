require "test_helper"

describe Review do

  context 'associations' do
    should belong_to(:user)
    should belong_to(:movie)
  end

  context 'required fields' do
    should validate_presence_of(:title)
    should validate_presence_of(:body)
    should validate_presence_of(:rating)
    should validate_presence_of(:user_id)
    should validate_presence_of(:movie_id)
  end

  context 'special constraints' do
    subject {Review.new(title: "Test", body: 'Body', rating: '5', user_id: '1', movie_id: '1')}
    should validate_uniqueness_of(:movie_id).scoped_to(:user_id).with_message("already reviewed.")
  end

  context 'rating range is between 1 and 10' do
    should allow_value('1', '2', '3', '4', '5', '6', '7', '8', '9', '10').for(:rating)
    should_not allow_value('-1').for(:rating)
    should_not allow_value('0').for(:rating)
    should_not allow_value('11').for(:rating)
    should_not allow_value('foo').for(:rating)
  end
end
