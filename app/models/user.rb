class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 5}
end
