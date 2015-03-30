require 'test_helper'

feature 'user posts movie review' do

  before do
    create_and_authenticate_valid_user
    @movie = create_movie
  end

  scenario 'success with valid data' do
    visit new_movie_review_path(@movie)

    starting_count = Review.all.count

    fill_in "Title", with: 'Mock Review Title'
    fill_in "Summary", with: 'Mock Review Summary'
    fill_in "Body", with: "Some mock text body here"
    select '5', from: 'Rating'

    click_button "Submit Review"

    Review.all.count.must_equal(starting_count + 1)
    current_path.must_equal(movie_path(@movie))
  end

  scenario 'failure and errors with invalid data' do
    visit new_movie_review_path(@movie)

    starting_count = Review.all.count

    click_button "Submit Review"

    Review.all.count.must_equal(starting_count)
    current_path.must_equal(movie_reviews_path(@movie))

    page.must_have_content("Title can't be blank")
    page.must_have_content("Body can't be blank")
  end
end
