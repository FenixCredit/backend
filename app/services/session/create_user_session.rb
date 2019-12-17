class Session::CreateUserSession
  Result = ImmutableStruct.new(:session_created?, :session, :errors)

  def self.call(session_params)
    @admin = Admin.find_by_email(session_params[:email])

    if @admin&.authenticate(session_params[:password])
      Result.new(
        session_created: true,
        session: create_session,
        errors: []
      )
    else
      Result.new(
        session_created: false,
        session: nil,
        errors: ['Invalid password']
      )
    end
  end

  private

  def self.create_session
    token = @admin.user.tokens.create(token_type: :session)
  end
end
