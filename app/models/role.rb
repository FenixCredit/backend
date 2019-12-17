class Role < ApplicationRecord
  has_many :employees, dependent: :nullify

  validates :name, uniqueness: true
end
