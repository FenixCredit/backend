class Api::V1::Dashboard::Promoter::OnlySerializer < ActiveModel::Serializer
  attributes :id, :aka, :contract
end
