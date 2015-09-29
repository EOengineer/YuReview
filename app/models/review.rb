class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie

  RATINGS = (1..10).to_a

  validates :title, presence: true
  validates :body, presence: true
  validates :rating, presence: true, inclusion: { in: RATINGS }
  validates :user_id, presence: true


end
