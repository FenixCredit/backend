class Api::V1::Dashboard::Client::FullSerializer < ActiveModel::Serializer
  attributes :id, :client_type, :street, :external_number, :internal_number, :colony

  attribute(:user) do
    ActiveModelSerializers::SerializableResource.new(
      object.user,
      serializer: Api::V1::Dashboard::UserSerializer,
      adapter: :attributes
    )
  end

  attribute(:promoter) do
    ActiveModelSerializers::SerializableResource.new(
      object.promoter,
      serializer: Api::V1::Dashboard::Promoter::FullSerializer,
      adapter: :attributes
    )
  end
end
