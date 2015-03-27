require "test_helper"

describe User do

  context 'required fields' do
    should validate_presence_of(:email)
    should validate_presence_of(:first_name)
    should validate_presence_of(:password)
  end

  context 'required with data' do
    should allow_value('test@test.com').for(:email)
    should_not allow_value(nil).for(:email)
    should_not allow_value('').for(:email)

    should allow_value('name').for(:first_name)
    should_not allow_value(nil).for(:first_name)
    should_not allow_value('').for(:first_name)
  end

  context 'verifies password format' do
    should allow_value('password').for(:password)
    should_not allow_value(nil).for(:password)
    should_not allow_value('').for(:password)
    should_not allow_value('four').for(:password)
  end
end
