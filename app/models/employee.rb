class Employee < ApplicationRecord
  belongs_to :user
  belongs_to :admin
  belongs_to :role

  validates :email, uniqueness: true

  validates :email, presence: true

  enum status: { enabled: 1, disabled: 2 }

  has_secure_password
end
