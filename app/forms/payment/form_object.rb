class Payment::FormObject
  include ActiveModel::Model

  attr_accessor :quantity, :status, :client_id, :loan_id, :promoter_id

  attr_reader :payment

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
    @payment = Payment.create!(payment_attributes)
  end

  def payment_attributes
    {
      quantity: quantity,
      status: status,
      client_id: client_id,
      loan_id: loan_id,
      promoter_id: promoter_id
    }.reject { |_, v| v.nil? }
  end
end
