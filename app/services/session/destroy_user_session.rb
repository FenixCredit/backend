class Session::DestroyUserSession
  Result = ImmutableStruct.new(:session_destroyed?, :errors)

  def self.call(session_token)
    Token.find_by(content: session_token).destroy!

    Result.new(
      session_destroyed: true,
      errors: []
    )
  rescue ActiveRecord::RecordNotDestroyed => e
    Result.new(
      session_destroyed: false,
      errors: e.record.errors.full_messages
    )
  end
end
