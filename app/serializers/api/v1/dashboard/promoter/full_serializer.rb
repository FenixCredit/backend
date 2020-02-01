class Api::V1::Dashboard::Promoter::FullSerializer < ActiveModel::Serializer
  attributes :id, :aka, :contract, :comission, :address

  attribute(:user) do
    ActiveModelSerializers::SerializableResource.new(
      object.user,
      serializer: Api::V1::Dashboard::UserSerializer,
      adapter: :attributes
    )
  end

  attribute(:employee) do
    ActiveModelSerializers::SerializableResource.new(
      object.employee,
      serializer: Api::V1::Dashboard::Employee::FullSerializer,
      adapter: :attributes
    )
  end
end
