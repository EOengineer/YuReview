require 'test_helper'

feature 'user edits a movie review' do

  before do
    create_and_authenticate_valid_user
    @movie = create_movie
    @review = create_review
  end

  after do
    teardown_movie_review
  end

  scenario 'successful with valid data' do
    visit edit_movie_review_path(@movie, @review)

    fill_in 'Title', with: 'Edited Title'
    fill_in 'Summary', with: 'Edited Summary'
    fill_in 'Body', with: 'Edited Body'
    select '5', from: 'Rating'

    click_button 'Update Review'

    @review.reload

    @review.title.must_equal('Edited Title')
    @review.summary.must_equal('Edited Summary')
    @review.body.must_equal('Edited Body')
    @review.rating.must_equal(5)

    current_path.must_equal(movie_path(@movie))
    page.must_have_content("Review successfully updated.")
  end

  scenario 'failure and errors with invalid data' do
    visit edit_movie_review_path(@movie, @review)

    fill_in 'Title', with: nil
    fill_in 'Summary', with: nil
    fill_in 'Body', with: nil
    select '5', from: 'Rating'

    click_button 'Update Review'


    page.must_have_content("Title can't be blank")
    page.must_have_content("Body can't be blank")
  end
end
