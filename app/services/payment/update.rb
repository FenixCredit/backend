class Payment::Update
  Result = ImmutableStruct.new(:successful?, :payment, :errors)

  def self.call(params)
    payment = Payment.find_by_id(params[:id])

    if !payment.nil?
      payment.update!(params)

      Result.new(
        successful: true,
        payment: payment.reload,
        errors: nil
      )
    else
      Result.new(
        successful: false,
        payment: nil,
        errors: ['Payment doesnt exists']
      )
    end
  end
end
