class Api::V1::Dashboard::EmployeesController < ApplicationController
  def create
    @result = ::Employee::Create.call(employee_params)

    if @result.successful?
      render json: @result.employee,
              serializer: Api::V1::Dashboard::Employee::FullSerializer,
              status: :created
    else
      render json: { errors: @result.errors }, status: :bad_request
    end
  end

  def index
    employees = ::Employee.all

    render json: employees,
            each_serializer: Api::V1::Dashboard::Employee::FullSerializer,
            status: :ok
  end

  private

  def employee_params
    params.require(:employee).permit(
      :email,
      :password,
      :contract,
      :picture,
      :role_id,
      :salary,
      :address,
      user: [
        :first_name,
        :last_name,
        :phone,
        :gender,
        :birthday
      ]
    ).merge(
      admin_id: @current_user.admin.id
    )
  end
end
