class Loan < ApplicationRecord
  belongs_to :client
  has_one :promissory_note

  enum status: { payed: 1, cancelled: 2, retarded: 3, finished: 4 }
  validates :quantity, presence: true
end
