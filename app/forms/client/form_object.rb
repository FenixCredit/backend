class Client::FormObject
  include ActiveModel::Model

  attr_accessor :client_type, :street, :external_number, :internal_number, :colony, :user_id, :promoter_id

  attr_reader :client

  def save
    return false if invalid?

    ActiveRecord::Base.transaction do
      persist!
    end

    true
  rescue ActiveRecord::RecordInvalid => e
    e.record.errors.full_messages.each { |error| errors[:base] << error }
    false
  end

  private

  def persist!
    @client = Client.create!(client_attributes)
  end

  def client_attributes
    {
      client_type: client_type,
      street: street,
      external_number: external_number,
      internal_number: internal_number,
      colony: colony,
      user_id: user_id,
      promoter_id: promoter_id,
    }.reject { |_, v| v.nil? }
  end
end
