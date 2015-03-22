require "test_helper"

feature "views movies index" do

  setup { create_movies(5) }
  teardown { Movie.delete_all}

  scenario "it welcomes" do
    visit movies_path
    page.must_have_content "Welcome to YuReview!"
  end

  scenario 'displays movies index' do
    visit movies_path
    current_path.must_equal(movies_path)
    page.must_have_content "#{Movie.first.title}"
    page.must_have_content "#{Movie.second.title}"
    page.must_have_content "#{Movie.third.title}"
    page.must_have_content "#{Movie.fourth.title}"
    page.must_have_content "#{Movie.fifth.title}"
  end

end
