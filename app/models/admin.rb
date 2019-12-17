class Admin < ApplicationRecord
  belongs_to :user

  validates :email, uniqueness: true

  validates :email, presence: true

  has_secure_password
end
