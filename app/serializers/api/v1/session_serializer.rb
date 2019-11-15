class Api::V1::SessionSerializer < ActiveModel::Serializer
  attribute(:token) { object.content }
end
