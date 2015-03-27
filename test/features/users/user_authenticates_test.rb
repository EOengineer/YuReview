require 'test_helper'

feature 'user authenticates' do

  before do
    @user = User.create(email: 'test@test_user.com',
      first_name: "test", last_name: 'user', password: 'password',
        password_confirmation: 'password')
  end

  after do
    User.delete_all
  end

  scenario 'with valid account' do
    visit signin_path

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    click_button 'Sign In'

    current_path.must_equal(movies_path)
    page.must_have_content("You've Signed In!")
  end


  scenario 'with missing fields' do
    visit signin_path

    fill_in 'Email', with: ''
    fill_in 'Password', with: ''

    click_button 'Sign In'

    current_path.must_equal(sessions_path)
    page.must_have_content("Email or Password Invalid.")
  end


end
