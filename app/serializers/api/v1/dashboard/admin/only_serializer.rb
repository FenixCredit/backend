class Api::V1::Dashboard::Admin::OnlySerializer < ActiveModel::Serializer
  attributes :id, :email, :photo
end
