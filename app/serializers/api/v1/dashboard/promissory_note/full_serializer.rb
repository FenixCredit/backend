class Api::V1::Dashboard::PromissoryNote::FullSerializer < ActiveModel::Serializer
  attributes :id, :file, :code, :created_at, :updated_at

  attribute(:products) do
    ActiveModelSerializers::SerializableResource.new(
      object.products,
      each_serializer: Api::V1::Dashboard::Product::OnlySerializer,
      adapter: :attributes
    )
  end
end
