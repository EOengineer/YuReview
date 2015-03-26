require "test_helper"

describe Movie do

  context 'required fields' do
    should validate_presence_of(:title)
    should validate_presence_of(:description)
    should validate_presence_of(:year)
  end

  context 'year format' do
    should allow_value('1994').for(:year)
    should_not allow_value('123').for(:year)
    should_not allow_value('12345').for(:year)
  end

  context 'required with data' do
    should_not allow_value(nil).for(:title)
    should_not allow_value('').for(:title)
    should_not allow_value(nil).for(:description)
    should_not allow_value('').for(:description)
    should_not allow_value(nil).for(:year)
    should_not allow_value('').for(:year)
  end
end
