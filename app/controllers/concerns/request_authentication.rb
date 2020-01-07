module RequestAuthentication
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_user
  end

  def session_token
    @session_token = request.headers.fetch('Authorization')
  end

  private

  def authenticate_user
    @current_user = Token.find_by_content(session_token).user
  end
end
