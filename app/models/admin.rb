class Admin < ApplicationRecord
  belongs_to :user
  has_many :employees, dependent: :nullify

  validates :email, uniqueness: true

  validates :email, presence: true

  has_secure_password
end