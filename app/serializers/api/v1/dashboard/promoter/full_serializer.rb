class Api::V1::Dashboard::Promoter::FullSerializer < ActiveModel::Serializer
  attributes :id, :aka, :contract

  belongs_to :user, serializer: Api::V1::Dashboard::UserSerializer
  belongs_to :employee, serializer: Api::V1::Dashboard::Employee::FullSerializer
end
