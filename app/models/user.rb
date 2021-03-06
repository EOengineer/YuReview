class User < ActiveRecord::Base
  before_save :downcase_email

  has_many :reviews

  has_secure_password
  validates :first_name, :admin, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, length: { minimum: 5}, on: :create


  private

  def downcase_email
    self.email = self.email.downcase
  end
end

