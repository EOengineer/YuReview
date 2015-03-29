class User < ActiveRecord::Base

  has_many :reviews

  has_secure_password
  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, length: { minimum: 5}
end
