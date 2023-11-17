# frozen_string_literal: true

require 'jwt'
require 'base64'

JWT_ALGORITHM = 'RS256'
# Get the key locally
# JWT_PRIVATE_KEY = OpenSSL::PKey::RSA.new(File.read(Rails.root.join('private_key.pem')))

# Get the key on Heroku
JWT_PRIVATE_KEY = OpenSSL::PKey::RSA.new(Base64.strict_decode64(ENV['PRIVATE_KEY']))
