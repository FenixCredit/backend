class Client::Create
  Result = ImmutableStruct.new(:successful?, :client, :errors)

  def self.call(params)
    form_user = User::FormObject.new(params[:user])

    if form_user.save
      form_client = Client::FormObject.new(
        params.except(:user).merge(
          user_id: form_user.user.id
        )
      )

      if form_client.save
        Result.new(
          successful: true,
          client: form_client.client,
          errors: ['']
        )
      else
        Result.new(
          successful: false,
          client: nil,
          errors: form_client.errors[:base]
        )
      end
    else
      Result.new(
        successful: false,
        client: nil,
        errors: form_user.errors[:base]
      )
    end
  end
end
