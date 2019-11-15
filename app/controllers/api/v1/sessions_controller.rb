class Api::V1::SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: [:create]

  def create
    @result = Session::CreateUserSession.call(session_params)

    if @result.session_created?
      @session = Session.new(JsonWebToken.encode(jwt_session_payload))

      render json: @session,
             serializer: Api::V1::SessionSerializer,
             root: :session
    else
      render json: { errors: @result.errors }, status: :bad_request
    end
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end

  def jwt_session_payload
    {
      token: @result.session.content
    }
  end
end
