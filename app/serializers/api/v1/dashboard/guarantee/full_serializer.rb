class Api::V1::Dashboard::Guarantee::FullSerializer < ActiveModel::Serializer
  attributes :id, :is_favourite, :street, :external_number, :internal_number, :colony, :identification, :address_proof, :warning_letter

  belongs_to :user, serializer: Api::V1::Dashboard::UserSerializer
end
