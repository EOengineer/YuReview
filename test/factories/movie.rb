FactoryGirl.define do
  factory :movie do
    sequence(:title) {|n| "Movie Title #{n}"}
    sequence(:description) {|n| "Movie #{n} description and stuff"}
    year 1992
  end
end
