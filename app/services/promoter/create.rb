class Promoter::Create
  Result = ImmutableStruct.new(:successful?, :promoter, :errors)

  def self.call(params)
    form_user = User::FormObject.new(params[:user])

    if form_user.save
      form_promoter = Promoter::FormObject.new(
        params.except(:user).merge(
          user_id: form_user.user.id
        )
      )

      if form_promoter.save
        Result.new(
          successful: true,
          promoter: form_promoter.promoter,
          errors: ['']
        )
      else
        Result.new(
          successful: false,
          promoter: nil,
          errors: form_promoter.errors[:base]
        )
      end
    else
      Result.new(
        successful: false,
        promoter: nil,
        errors: form_user.errors[:base]
      )
    end
  end
end
