class Api::V1::Dashboard::Employee::FullSerializer < ActiveModel::Serializer
  attributes :id, :email, :contract, :picture, :salary, :address, :status

  attribute(:user) do
    ActiveModelSerializers::SerializableResource.new(
      object.user,
      serializer: Api::V1::Dashboard::UserSerializer,
      adapter: :attributes
    )
  end

  attribute(:admin) do
    ActiveModelSerializers::SerializableResource.new(
      object.admin,
      serializer: Api::V1::Dashboard::Admin::FullSerializer,
      adapter: :attributes
    )
  end

  attribute(:role) do
    ActiveModelSerializers::SerializableResource.new(
      object.role,
      serializer: Api::V1::Dashboard::RoleSerializer,
      adapter: :attributes
    )
  end
end
