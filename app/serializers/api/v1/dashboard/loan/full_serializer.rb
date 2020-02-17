class Api::V1::Dashboard::Loan::FullSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :status, :period, :created_at

  attribute(:client) do
    ActiveModelSerializers::SerializableResource.new(
      object.client,
      serializer: Api::V1::Dashboard::Client::FullSerializer,
      adapter: :attributes
    )
  end

  attribute(:promissory_note) do
    ActiveModelSerializers::SerializableResource.new(
      object.promissory_note,
      serializer: Api::V1::Dashboard::PromissoryNote::FullSerializer,
      adapter: :attributes
    )
  end

  attribute(:payments) do
    ::Payment.get_executed(object).count + 1
  end

  attribute(:last_payment_status) do
    ::Payment.get_executed(object).order(:updated_at).last&.status or 'not_executed'
  end
end
