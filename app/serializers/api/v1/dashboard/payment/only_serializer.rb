class Api::V1::Dashboard::Payment::OnlySerializer < ActiveModel::Serializer
  attributes :id, :quantity, :status
end
