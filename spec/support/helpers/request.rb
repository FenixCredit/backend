module Helpers
  module Request
    def base_headers
      {
        'Accept': 'application/vnd.fenix.v1+json'
      }
    end

    def dashboard_headers
      base_headers.merge({ 'X-Platform': 'dashboard' })
    end

    def authorized_headers(user)
      {
        'Authorization': JsonWebToken.encode(user.tokens.first.content)
      }
    end
  end
end
