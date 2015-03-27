require 'test_helper'

feature 'user signs up' do
  include BCrypt

  before do
    @user = User.create(email: 'test@test_user.com',
      first_name: "test", last_name: 'user', password: 'password',
        password_confirmation: 'password')
  end

  after do
    User.delete_all
  end

  scenario 'success with valid data' do
    visit signup_path
    page.must_have_content("Join the YuReview Community.")

    starting_count = User.all.count

    fill_in "First name", with: 'John'
    fill_in "Last name", with: 'Smith'
    fill_in "Email", with: "mock_user@email.com"
    fill_in "Password", with: "mock_password"
    fill_in "Password confirmation", with: "mock_password"

    click_button 'Sign Up'

    User.all.count.must_equal(starting_count + 1)
    current_path.must_equal(movies_path)
  end

  scenario 'failure and errors when password confirmation doesnt match' do
    visit signup_path
    page.must_have_content("Join the YuReview Community.")

    starting_count = User.all.count

    fill_in "First name", with: 'John'
    fill_in "Last name", with: 'Smith'
    fill_in "Email", with: "mock_user@email.com"
    fill_in "Password", with: "mock_password"
    fill_in "Password confirmation", with: "oops_password"

    click_button 'Sign Up'


    User.all.count.must_equal(starting_count)
    current_path.must_equal(users_path)
    page.must_have_content("Password confirmation doesn't match Password")
  end

  scenario 'failure and errors when missing fields' do
    visit signup_path
    page.must_have_content("Join the YuReview Community.")

    starting_count = User.all.count

    fill_in "First name", with: ''
    fill_in "Last name", with: ''
    fill_in "Email", with: ""
    fill_in "Password", with: ""
    fill_in "Password confirmation", with: ""

    click_button 'Sign Up'


    User.all.count.must_equal(starting_count)
    current_path.must_equal(users_path)

    page.must_have_content("Password can't be blank")
    page.must_have_content("Password is too short (minimum is 5 characters)")
    page.must_have_content("First name can't be blank")
    page.must_have_content("Email can't be blank")
  end

  scenario 'failure and errors when account already exists' do
    visit signup_path
    page.must_have_content("Join the YuReview Community.")

    starting_count = User.all.count

    fill_in "First name", with: 'Forgetful'
    fill_in "Last name", with: 'User'
    fill_in "Email", with: @user.email
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"

    click_button 'Sign Up'


    User.all.count.must_equal(starting_count)
    current_path.must_equal(users_path)
    page.must_have_content("Email has already been taken")
  end
end
