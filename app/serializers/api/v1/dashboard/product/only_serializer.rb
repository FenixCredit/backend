class Api::V1::Dashboard::Product::OnlySerializer < ActiveModel::Serializer
  attributes :id, :name, :value, :photo
end
