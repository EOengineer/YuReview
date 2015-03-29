class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie

  RATINGS = (1..10).to_a
end
