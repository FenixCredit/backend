class Api::V1::Dashboard::UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :phone, :gender, :birthday
end
