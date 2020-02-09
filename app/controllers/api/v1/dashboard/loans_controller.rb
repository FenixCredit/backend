class Api::V1::Dashboard::LoansController < ApplicationController
  def create
    @result = ::Loan::Create.call(loan_params)

    if @result.successful?
      render json: @result.loan,
              serializer: Api::V1::Dashboard::Loan::FullSerializer,
              status: :created
    else
      render json: { errors: @result.errors }, status: :bad_request
    end
  end

  def index
    loans = ::Loan.all.order(created_at: :desc).page(1).per(5)

    render json: loans,
            each_serializer: Api::V1::Dashboard::Loan::FullSerializer,
            meta: pagination_meta(loans),
            status: :ok
  end

  def show
    loan = ::Loan.find_by_id(params[:id])

    render json: loan,
            serializer: Api::V1::Dashboard::Loan::FullSerializer,
            status: :ok
  end

  private

  def loan_params
    params.require(:loan).permit(
      :quantity,
      :period,
      :client_id,
      promissory_note: [
        :file,
        :code
      ],
      guarantee: [
        :id,
        :is_favourite,
        :street,
        :external_number,
        :internal_number,
        :colony,
        :identification,
        :address_proof,
        :warning_letter,
        user: [
          :first_name,
          :last_name,
          :phone,
          :gender,
          :birthday
        ]
      ]
    )
  end
end
