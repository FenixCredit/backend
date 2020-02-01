require 'elasticsearch/model'

class Client < ApplicationRecord
  belongs_to :user
  belongs_to :promoter
  has_many :loans

  enum client_type: { good: 1, bad: 2 }

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
            "client_type",
            "user.first_name",
            "user.last_name",
            "user.first_name",
            "promoter.aka",
            "promoter.user.first_name",
            "promoter.user.last_name",
            "promoter.user.first_name"
          ],
          fuzziness: 'AUTO'
        }
      }
    ]
  end

  def as_indexed_json(options = {})
    self.as_json(
      only: [:id, :client_type],
      include: {
        user: {
          only: [:first_name, :last_name, :gender, :phone]
        },
        promoter: {
          only: [:aka],
          include: {
            user: {
              only: [:first_name, :last_name, :gender, :phone]
            }
          }
        }
      }
    )
  end

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
end
