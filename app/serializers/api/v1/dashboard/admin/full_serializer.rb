class Api::V1::Dashboard::Admin::FullSerializer < ActiveModel::Serializer
  attributes :id, :email, :photo

  belongs_to :user, serializer: Api::V1::Dashboard::UserSerializer
end
