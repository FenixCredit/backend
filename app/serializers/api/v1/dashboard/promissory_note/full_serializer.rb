class Api::V1::Dashboard::PromissoryNote::FullSerializer < ActiveModel::Serializer
  attributes :id, :file, :code, :created_at, :updated_at
end
