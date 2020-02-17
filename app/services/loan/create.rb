class Loan::Create
  Result = ImmutableStruct.new(:successful?, :loan, :errors)

  def self.call(params)
    guarantee = nil
    promissory_note = nil
    loan = nil

    guarantee_data = params[:guarantee]
    promissory_note_data = params[:promissory_note].except(:products)
    loan_data = params.except(:guarantee, :promissory_note)

    if guarantee_data[:id].nil? || guarantee_data[:id] == "null"
      form_user = User::FormObject.new(guarantee_data[:user])

      if form_user.save
        form_guarantee = Guarantee::FormObject.new(
          guarantee_data.except(:id, :user).merge(
            user_id: form_user.user.id
          )
        )

        if form_guarantee.save
          guarantee = form_guarantee.guarantee
        else
          return Result.new(
            successful: false,
            loan: nil,
            errors: form_guarantee.errors[:base]
          )
        end
      else
        return Result.new(
          successful: false,
          loan: nil,
          errors: form_user.errors[:base]
        )
      end
    else
      guarantee = Guarantee.find_by_id(guarantee_data[:id])

      if guarantee.nil?
        return Result.new(
          successful: false,
          loan: nil,
          errors: ['No existe este usuario']
        )
      end
    end

    form_loan = Loan::FormObject.new(loan_data)

    if form_loan.save
      loan = form_loan.loan
    else
      return Result.new(
        successful: false,
        loan: nil,
        errors: form_loan.errors[:base]
      )
    end

    if !loan.nil? && !guarantee.nil?
      form_promissory_note = PromissoryNote::FormObject.new(promissory_note_data.merge(
        loan_id: loan.id,
        guarantee_id: guarantee.id
      ))

      13.times do
        ::Payment.create!(loan: loan, client: loan.client, promoter: loan.client.promoter)
      end

      if form_promissory_note.save

        Result.new(
          successful: true,
          loan: loan,
          errors: nil
        )
      else
        Result.new(
          successful: false,
          loan: nil,
          errors: form_promissory_note.errors[:base]
        )
      end
    end
  end
end
