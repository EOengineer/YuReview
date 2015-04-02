class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie

  RATINGS = (1..10).to_a

  validates :title, presence: true
  validates :body, presence: true
  validates :rating, presence: true, inclusion: { in: RATINGS }
  validates :movie_id, presence: true, uniqueness: { scope: :user_id, message: "already reviewed."}
  validates :user_id, presence: true


end
