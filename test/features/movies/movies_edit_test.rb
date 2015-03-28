require 'test_helper'

feature 'edits an existing movie' do
  before do
    @movie = create_movie
    create_and_authenticate_valid_user
  end

  after do
    Movie.delete_all
  end

  scenario 'successful with valid data' do
    visit edit_admin_movie_path(@movie)
    current_path.must_equal(edit_admin_movie_path(@movie))

    starting_count = Movie.all.count

    fill_in 'Title', with: @movie.title + ' edited'
    fill_in 'Description', with: @movie.description + " edited"
    fill_in 'Year', with: @movie.year

    click_button 'Update Movie'

    @movie.reload
    current_path.must_equal(movie_path(@movie))
    Movie.all.count.must_equal(starting_count)

    page.must_have_content('title edited')
    page.must_have_content('description edited')
    page.must_have_content('movie successfully updated')
  end

  scenario 'fails and errors with invalid data' do
    visit edit_admin_movie_path(@movie)
    current_path.must_equal(edit_admin_movie_path(@movie))

    starting_count = Movie.all.count

    fill_in 'Title', with: nil
    fill_in 'Description', with: nil

    click_button 'Update Movie'

    current_path.must_equal(admin_movie_path(@movie))
    Movie.all.count.must_equal(starting_count)

    page.must_have_content("Title can't be blank")
    page.must_have_content("Description can't be blank")

  end

  scenario 'fails and errors with below range year' do
    visit edit_admin_movie_path(@movie)
    current_path.must_equal(edit_admin_movie_path(@movie))

    starting_count = Movie.all.count

    fill_in 'Title', with: @movie.title + ' edited'
    fill_in 'Description', with: @movie.description + " edited"
    fill_in 'Year', with: '1899'

    click_button 'Update Movie'

    current_path.must_equal(admin_movie_path(@movie))
    Movie.all.count.must_equal(starting_count)

    page.must_have_content("Year is not included in the list")

  end

  scenario 'fails and errors with invalid year format' do
    visit edit_admin_movie_path(@movie)
    current_path.must_equal(edit_admin_movie_path(@movie))

    starting_count = Movie.all.count

    fill_in 'Title', with: @movie.title + ' edited'
    fill_in 'Description', with: @movie.description + " edited"
    fill_in 'Year', with: '200'

    click_button 'Update Movie'

    current_path.must_equal(admin_movie_path(@movie))
    Movie.all.count.must_equal(starting_count)

    page.must_have_content("Year is not included in the list")
    page.must_have_content("Year should have at least 4 digits")

  end
end
