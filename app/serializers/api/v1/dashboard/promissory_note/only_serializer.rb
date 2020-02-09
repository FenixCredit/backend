class Api::V1::Dashboard::PromissoryNote::OnlySerializer < ActiveModel::Serializer
  attributes :id, :file, :code, :created_at, :updated_at
end
