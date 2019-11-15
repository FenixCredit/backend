class User::FormObject
  include ActiveModel::Model

  attr_accessor :first_name, :last_name, :email, :phone, :gender,
                :profile_picture, :birthday, :is_active, :preferences,
                :password, :password_confirmation

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
      email: email,
      phone: phone,
      gender: gender.to_i,
      profile_picture: profile_picture,
      birthday: birthday,
      is_active: is_active,
      preferences: preferences,
      password: password,
      password_confirmation: password_confirmation
    }
  end
end
