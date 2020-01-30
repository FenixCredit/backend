class Client < ApplicationRecord
  belongs_to :user
  belongs_to :promoter
  has_many :loans

  enum client_type: { good: 1, bad: 2 }
end
