class Admin::Create
  Result = ImmutableStruct.new(:successful?, :admin, :errors)

  def self.call(params)
    form_user = User::FormObject.new(params[:user])

    if form_user.save
      form_admin = Admin::FormObject.new(
        params.except(:user).merge(
          user_id: form_user.user.id
        )
      )

      if form_admin.save
        Result.new(
          successful: true,
          admin: form_admin.admin,
          errors: ['']
        )
      else
        Result.new(
          successful: false,
          admin: nil,
          errors: form_admin.errors[:base]
        )
      end
    else
      Result.new(
        successful: false,
        admin: nil,
        errors: form_user.errors[:base]
      )
    end
  end
end
