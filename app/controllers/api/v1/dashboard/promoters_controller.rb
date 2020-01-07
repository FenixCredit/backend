class Api::V1::Dashboard::PromotersController < ApplicationController
  def create
    @result = ::Promoter::Create.call(promoter_params)

    if @result.successful?
      render json: @result.promoter,
              serializer: Api::V1::Dashboard::Promoter::FullSerializer,
              status: :created
    else
      render json: { errors: @result.errors[:base] }, status: :bad_request
    end
  end

  def index
    promoters = ::Promoter.all

    render json: promoters,
            each_serializer: Api::V1::Dashboard::Promoter::FullSerializer,
            status: :ok
  end

  private

  def promoter_params
    params.require(:promoter).permit(
      :aka,
      :contract,
      :address,
      :comission,
      user: [
        :first_name,
        :last_name,
        :phone,
        :gender,
        :birthday
      ]
    ).merge(
      employee_id: @current_user.employee.id
    )
  end
end
