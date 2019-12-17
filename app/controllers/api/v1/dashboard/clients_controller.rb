class Api::V1::Dashboard::ClientsController < ApplicationController
  def create
    @result = ::Client::Create.call(client_params)

    if @result.successful?
      render json: @result.client,
              serializer: Api::V1::Dashboard::Client::FullSerializer,
              status: :created
    else
      render json: { errors: @result.errors[:base] }, status: :bad_request
    end
  end

  def index
    clients = ::Client.all

    render json: clients,
            each_serializer: Api::V1::Dashboard::Client::FullSerializer,
            status: :ok
  end

  private

  def client_params
    params.require(:client).permit(
      :client_type,
      :street,
      :external_number,
      :internal_number,
      :colony,
      :promoter_id,
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
