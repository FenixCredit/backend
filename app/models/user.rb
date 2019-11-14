class User < ApplicationRecord
  validates :email, uniqueness: true

  validates :first_name, :last_name, :email, presence: true

  enum gender: { male: 0, female: 1, other: 2 }

  has_secure_password
end
