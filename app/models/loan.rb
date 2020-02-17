class Loan < ApplicationRecord
  belongs_to :client
  has_one :promissory_note, dependent: :destroy
  has_many :payments, dependent: :destroy

  enum status: { payed: 1, cancelled: 2, retarded: 3, finished: 4, in_course: 5 }
  validates :quantity, presence: true
end
