class Movie < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :year, presence: true,
            format: { with: /\A[1-9]\d{3,}\z/,
                        message: "should have at least 4 digits"},
            inclusion: { in: 1900..Date.today.year }

end
