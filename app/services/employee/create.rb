class Employee::Create
  Result = ImmutableStruct.new(:successful?, :employee, :errors)

  def self.call(params)
    form_user = User::FormObject.new(params[:user])

    if form_user.save
      form_employee = Employee::FormObject.new(
        params.except(:user).merge(
          user_id: form_user.user.id
        )
      )

      if form_employee.save
        Result.new(
          successful: true,
          employee: form_employee.employee,
          errors: ['']
        )
      else
        Result.new(
          successful: false,
          employee: nil,
          errors: form_employee.errors[:base]
        )
      end
    else
      Result.new(
        successful: false,
        employee: nil,
        errors: form_user.errors[:base]
      )
    end
  end
end
