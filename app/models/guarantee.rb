class Guarantee < ApplicationRecord
  belongs_to :user
  has_many :promissory_notes

  validates :identification, :address_proof, :warning_letter, presence: true

  mount_uploader :identification, GuaranteeIdentificationUploader
  mount_uploader :address_proof, GuaranteeAddressProofUploader
  mount_uploader :warning_letter, GuaranteeWarningLetterUploader

end
