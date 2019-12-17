class Admin::FormObject
  include ActiveModel::Model

  attr_accessor :email, :password, :password_confirmation, :photo, :user_id

  attr_reader :admin

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
    @admin = Admin.create!(admin_attributes)
  end

  def admin_attributes
    {
      email: email,
      password: password,
      password_confirmation: password_confirmation,
      photo: photo,
      user_id: user_id
    }
  end
end
