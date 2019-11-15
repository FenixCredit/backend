module RequestAuthentication
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_user
  end

  def session_token
    jwt = JsonWebToken.decode(request.headers.fetch('Authorization'))
    @session_token = jwt[:token]
  end

  private

  def authenticate_user
    @current_user = Token.find_by_content(session_token)
  end
end
