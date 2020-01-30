class Guarantee < ApplicationRecord
  belongs_to :user
  has_many :promissory_notes

  validates :identification, :address_proof, :warning_letter, presence: true
end
