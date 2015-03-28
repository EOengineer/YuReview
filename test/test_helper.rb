ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
# require "minitest/rails/capybara"

# Uncomment for awesome colorful output
# require "minitest/pride"

class ActiveSupport::TestCase
    ActiveRecord::Migration.check_pending!

    # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  def create_movies(num)
    Movie.delete_all
    num = 1 if !num
    num.to_i.times do |n|
      Movie.create(title: "title #{n}", description: "description #{n}", year: 1990)
    end
    Movie.all
  end

  def create_movie
    Movie.delete_all
    Movie.create(title: "title", description: "description", year: 1990)
  end

  def build_movie
    Movie.new(title: "title", description: "description", year: 1990)
  end

  def create_and_authenticate_valid_user
    @user = User.create(email: 'test@test_user.com',
      first_name: "test", last_name: 'user', password: 'password',
        password_confirmation: 'password')

    visit signin_path

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    click_button 'Sign In'
  end



  # Add more helper methods to be used by all tests here...
end
