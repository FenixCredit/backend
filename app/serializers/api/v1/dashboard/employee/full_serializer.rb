class Api::V1::Dashboard::Employee::FullSerializer < ActiveModel::Serializer
  attributes :id, :email, :contract, :picture, :status

  belongs_to :user, serializer: Api::V1::Dashboard::UserSerializer
  belongs_to :admin, serializer: Api::V1::Dashboard::Admin::FullSerializer
  belongs_to :role, serializer: Api::V1::Dashboard::RoleSerializer
end
