class User < ApplicationRecord
  has_many :tokens, dependent: :destroy
  has_one :admin, dependent: :destroy
  has_one :employee, dependent: :destroy
  has_one :promoter, dependent: :destroy
  has_one :client, dependent: :destroy
  has_one :guarantee, dependent: :destroy

  validates :first_name, :last_name, presence: true

  enum gender: { male: 0, female: 1, other: 2 }
end
