# frozen_string_literal: true

class JwtService
  def self.generate_jwt(payload)
    JWT.encode(payload, JWT_PRIVATE_KEY, JWT_ALGORITHM)
  end
end
