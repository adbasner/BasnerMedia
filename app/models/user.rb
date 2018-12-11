class User < ApplicationRecord
  has_secure_password
  has_many :posts, dependent: :destroy
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :password_confirmation, presence: true
end
