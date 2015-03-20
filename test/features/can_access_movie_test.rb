require "test_helper"

feature "CanAccessMovie" do

  setup { build_movies }
  teardown { Movie.delete_all}

  scenario "it welcomes" do
    visit movies_path
    page.must_have_content "Welcome to YuReview!"
  end

  scenario 'displays movies index' do
    visit movies_path
    page.must_have_content "#{Movie.first.title}"
    page.must_have_content "#{Movie.second.title}"
    page.must_have_content "#{Movie.third.title}"
    page.must_have_content "#{Movie.fourth.title}"
    page.must_have_content "#{Movie.fifth.title}"
  end

  private

  def build_movies
    5.times do |n|
      Movie.create(title: "title #{n}", description: "description #{n}", year: 1990)
    end
  end
end
