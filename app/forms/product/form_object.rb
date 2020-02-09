class Product::FormObject
  include ActiveModel::Model

  attr_accessor :name, :value, :photo

  attr_reader :product

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
    @product = Product.create!(product_attributes)
  end

  def product_attributes
    {
      name: name,
      value: value,
      photo: photo
    }.reject { |_, v| v.nil? }
  end
end
