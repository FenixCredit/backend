class Api::V1::Dashboard::Client::OnlySerializer < ActiveModel::Serializer
  attributes :id, :client_type, :street, :external_number, :internal_number, :colony
end
