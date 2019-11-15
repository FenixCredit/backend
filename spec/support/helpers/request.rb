module Helpers
  module Request
    def base_headers
      {
        'Accept' => 'application/vnd.fenix.v1+json',
      }
    end
  end
end
