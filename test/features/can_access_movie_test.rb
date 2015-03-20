require "test_helper"

feature "CanAccessMovie" do
  scenario "the test is sound" do
    visit movies_path
    page.must_have_content "Welcome to YuReview!"
  end
end
