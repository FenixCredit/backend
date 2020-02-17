class Api::V1::Dashboard::PaymentsController < ApplicationController
  def update
    @result = ::Payment::Update.call(payment_params)

    if @result.successful?
      render json: @result.payment,
              serializer: Api::V1::Dashboard::Payment::OnlySerializer,
              status: :created
    else
      render json: { errors: @result.errors }, status: :bad_request
    end
  end

  private

  def payment_params
    params.require(:payment).permit(
      :quantity,
      :status
    ).merge(id: params[:id])
  end
end
