require 'elasticsearch/model'

class Guarantee < ApplicationRecord
  belongs_to :user
  has_many :promissory_notes
  has_many :products, through: :guarantee_products
  has_many :guarantee_products

  validates :identification, :address_proof, :warning_letter, presence: true

  mount_uploader :identification, GuaranteeIdentificationUploader
  mount_uploader :address_proof, GuaranteeAddressProofUploader
  mount_uploader :warning_letter, GuaranteeWarningLetterUploader

  scope :elastic_search, -> (filters) do
    __elasticsearch__.search(
      {
        from: 0, size: 1000,
        query: {
          bool: {
            must: filters
          }
        }
      }
    ).records
  end

  scope :fulltext_search, -> (query) do
    [
      {
        multi_match: {
          query: query,
          fields: [
            "id",
            "user.first_name",
            "user.last_name",
            "user.first_name"
          ],
          fuzziness: 'AUTO'
        }
      }
    ]
  end

  def as_indexed_json(options = {})
    self.as_json(
      only: [:id],
      include: {
        user: {
          only: [:first_name, :last_name, :gender, :phone]
        }
      }
    )
  end

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
end
