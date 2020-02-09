class Api::V1::Dashboard::ProductsController < ApplicationController
  def create
    @result = ::Product::Create.call(product_params)

    if @result.successful?
      render json: @result.product,
              serializer: Api::V1::Dashboard::Product::OnlySerializer,
              status: :created
    else
      render json: { errors: @result.errors }, status: :bad_request
    end
  end

  private

  def product_params
    params.require(:product).permit(
      :name,
      :value,
      :photo,
      guarantee_product: [
        :promissory_note_id
      ]
    )
  end
end
