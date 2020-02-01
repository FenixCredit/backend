class GuaranteeProduct::FormObject
  include ActiveModel::Model

  attr_accessor :promissory_note_id, :product_id

  attr_reader :guarantee_product

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
    @guarantee_product = GuaranteeProduct.create!(guarantee_product_attributes)
  end

  def guarantee_product_attributes
    {
      promissory_note_id: promissory_note_id,
      product_id: product_id
    }.reject { |_, v| v.nil? }
  end
end
