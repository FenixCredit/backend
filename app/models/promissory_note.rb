class PromissoryNote < ApplicationRecord
  belongs_to :loan
  belongs_to :guarantee
  has_many :guarantee_products
  has_many :products, through: :guarantee_products

  validates :file, :code, presence: true

  mount_uploader :file, PromissoryNoteFileUploader
end
