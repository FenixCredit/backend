class Api::V1::Dashboard::AdminsController < ApplicationController
  def create
    @result = Admin::Create.call(admin_params)

    if @result.successful?
      render json: @result.admin,
              serializer: Api::V1::Dashboard::Admin::FullSerializer,
              status: :created
    else
      render json: { errors: @result.errors }, status: :bad_request
    end
  end

  def index
    admins = Admin.all

    render json: admins,
            each_serializer: Api::V1::Dashboard::Admin::FullSerializer,
            status: :ok
  end

  def profile
    render json: @current_user.admin,
            serializer: Api::V1::Dashboard::Admin::FullSerializer,
            status: :ok
  end

  private

  def admin_params
    params.require(:admin).permit(
      :email,
      :password,
      :photo,
      user: [
        :first_name,
        :last_name,
        :phone,
        :gender,
        :birthday
      ]
    )
  end
end
