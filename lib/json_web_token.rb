class JsonWebToken
   SECRET_KEY = Rails.application.secrets.secret_key_base.to_s

  def self.decode(token)
    body = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new(body)
  rescue
    nil
  end

  def self.encode(payload)
    JWT.encode(payload, SECRET_KEY)
  end
end
