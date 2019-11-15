class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_user, only: [:create]

  def create
    @form = User::FormObject.new(user_params)
    if @form.save
      render json: @form.user, status: :created
    else
      render json: { errors: @form.errors[:base] }, status: :bad_request
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :phone,
      :gender,
      :profile_picture,
      :birthday,
      :is_active,
      :password,
      :password_confirmation
    )
  end
end
