class Token < ApplicationRecord
  belongs_to :user

  enum token_type: { session: 0 }

  has_secure_token :content
end
