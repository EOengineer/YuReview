require 'test_helper'

feature "Views a movie's show page" do

  before do
    @movie = create_movies(2)
    create_and_authenticate_valid_user
  end

  after do
    Movie.delete_all
  end

  scenario "views first movie path" do
    visit movie_path(@movie.first)
    current_path.must_equal(movie_path(@movie.first))

    page.must_have_content "#{Movie.first.title}"
    page.must_have_content "#{Movie.first.description}"
    page.must_have_content "#{Movie.first.year}"
  end

  scenario "views second movie path" do
    visit movie_path(@movie.second)
    current_path.must_equal(movie_path(@movie.second))

     page.must_have_content "#{Movie.second.title}"
     page.must_have_content "#{Movie.second.description}"
     page.must_have_content "#{Movie.second.year}"
  end
end
