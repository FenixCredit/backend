class Api::V1::Dashboard::Guarantee::OnlySerializer < ActiveModel::Serializer
  attributes :id, :is_favourite, :street, :external_number, :internal_number, :colony, :identification, :address_proof, :warning_letter
end
