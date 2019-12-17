class Api::V1::Dashboard::Client::FullSerializer < ActiveModel::Serializer
  attributes :id, :client_type, :street, :external_number, :internal_number, :colony

  belongs_to :user, serializer: Api::V1::Dashboard::UserSerializer
  belongs_to :promoter, serializer: Api::V1::Dashboard::Promoter::FullSerializer
end
