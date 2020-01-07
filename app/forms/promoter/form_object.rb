class Promoter::FormObject
  include ActiveModel::Model

  attr_accessor :aka, :contract, :address, :comission, :user_id, :employee_id

  attr_reader :promoter

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
    @promoter = Promoter.create!(promoter_attributes)
  end

  def promoter_attributes
    {
      aka: aka,
      contract: contract,
      address: address,
      comission: comission,
      user_id: user_id,
      employee_id: employee_id,
    }.reject { |_, v| v.nil? }
  end
end
