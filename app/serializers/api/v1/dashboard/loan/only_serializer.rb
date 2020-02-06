class Api::V1::Dashboard::Loan::OnlySerializer < ActiveModel::Serializer
  attributes :id, :quantity, :status, :period
end
