class Api::V1::Dashboard::GuaranteesController < ApplicationController
  def index
    loans = ::Guarantee::DefaultFilter.new.filter(params)

    render json: loans,
            each_serializer: Api::V1::Dashboard::Guarantee::FullSerializer,
            status: :ok
  end
end
