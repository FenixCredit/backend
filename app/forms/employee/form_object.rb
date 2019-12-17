class Employee::FormObject
  include ActiveModel::Model

  attr_accessor :email, :password, :password_confirmation, :contract, :picture, :status, :user_id, :admin_id, :role_id

  attr_reader :employee

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
    @employee = Employee.create!(employee_attributes)
  end

  def employee_attributes
    {
      email: email,
      password: password,
      password_confirmation: password_confirmation,
      contract: contract,
      picture: picture,
      status: status,
      user_id: user_id,
      admin_id: admin_id,
      role_id: role_id,
    }.reject { |_, v| v.nil? }
  end
end
