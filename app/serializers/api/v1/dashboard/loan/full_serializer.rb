class Api::V1::Dashboard::Loan::FullSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :status, :period, :created_at

  belongs_to :client, serializer: Api::V1::Dashboard::Client::FullSerializer
end
