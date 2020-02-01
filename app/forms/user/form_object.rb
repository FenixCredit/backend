class User::FormObject
  include ActiveModel::Model

  attr_accessor :first_name, :last_name, :phone, :gender, :birthday

  attr_reader :user

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
    @user = User.create!(user_attributes)
  end

  def user_attributes
    {
      first_name: first_name,
      last_name: last_name,
      phone: phone,
      gender: gender.to_i,
      birthday: birthday
    }.reject { |_, v| v.nil? }
  end
end
