class Loan::FormObject
  include ActiveModel::Model

  attr_accessor :quantity, :status, :period, :client_id

  attr_reader :loan

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
    @loan = Loan.create!(loan_attributes)
  end

  def loan_attributes
    {
      quantity: quantity,
      status: status,
      period: period,
      client_id: client_id
    }.reject { |_, v| v.nil? }
  end
end
