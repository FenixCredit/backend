class Guarantee::FormObject
  include ActiveModel::Model

  attr_accessor :is_favourite, :street, :external_number, :internal_number, :colony, :identification, :address_proof, :warning_letter, :user_id

  attr_reader :guarantee

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
    @guarantee = Guarantee.create!(guarantee_attributes)
  end

  def guarantee_attributes
    {
      is_favourite: is_favourite,
      street: street,
      external_number: external_number,
      internal_number: internal_number,
      colony: colony,
      identification: identification,
      address_proof: address_proof,
      warning_letter: warning_letter,
      user_id: user_id
    }.reject { |_, v| v.nil? }
  end
end
