require 'test_helper'

feature 'admin creates a new movie' do

  def setup
    @movie = build_movie
  end

  teardown {Movie.delete_all}


  scenario 'success with valid data' do
    visit new_admin_movie_path
    current_path.must_equal(new_admin_movie_path)

    starting_count = Movie.all.count

    fill_in 'Title', with: @movie.title
    fill_in 'Description', with: @movie.description
    fill_in 'Year', with: @movie.year

    click_button 'Create Movie'

    @movie = Movie.last
    current_path.must_equal(movie_path(@movie))
    Movie.all.count.must_equal(starting_count + 1)
  end

  scenario 'fails and errors with invalid data' do
    visit new_admin_movie_path
    current_path.must_equal(new_admin_movie_path)

    starting_count = Movie.all.count


    click_button 'Create Movie'

    @movie = Movie.last
    current_path.must_equal(admin_movies_path)
    Movie.all.count.must_equal(starting_count)

    page.must_have_content("Title can't be blank")
    page.must_have_content("Description can't be blank")
    page.must_have_content("Year can't be blank")
    page.must_have_content("Year is not included in the list")
    page.must_have_content("Year should have at least 4 digits")
  end

  scenario 'fails with below range year' do
    visit new_admin_movie_path
    current_path.must_equal(new_admin_movie_path)

    starting_count = Movie.all.count

    fill_in 'Title', with: @movie.title
    fill_in 'Description', with: @movie.description
    fill_in 'Year', with: '1899'

    click_button 'Create Movie'

    @movie = Movie.last
    current_path.must_equal(admin_movies_path)
    Movie.all.count.must_equal(starting_count)

    page.must_have_content("Year is not included in the list")
  end

  scenario 'fails with invalid year format' do
    visit new_admin_movie_path
    current_path.must_equal(new_admin_movie_path)

    starting_count = Movie.all.count

    fill_in 'Title', with: @movie.title
    fill_in 'Description', with: @movie.description
    fill_in 'Year', with: '200'

    click_button 'Create Movie'

    @movie = Movie.last
    current_path.must_equal(admin_movies_path)
    Movie.all.count.must_equal(starting_count)

    page.must_have_content("Year is not included in the list")
    page.must_have_content("Year should have at least 4 digits")
  end

end
