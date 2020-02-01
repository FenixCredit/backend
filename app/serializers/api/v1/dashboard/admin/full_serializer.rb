class Api::V1::Dashboard::Admin::FullSerializer < ActiveModel::Serializer
  attributes :id, :email, :photo

  attribute(:user) do
    ActiveModelSerializers::SerializableResource.new(
      object.user,
      serializer: Api::V1::Dashboard::UserSerializer,
      adapter: :attributes
    )
  end
end
