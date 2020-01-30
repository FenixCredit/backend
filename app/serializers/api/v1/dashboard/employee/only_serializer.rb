class Api::V1::Dashboard::Employee::OnlySerializer < ActiveModel::Serializer
  attributes :id, :email, :contract, :picture, :salary, :address, :status

  belongs_to :role, serializer: Api::V1::Dashboard::RoleSerializer
end
