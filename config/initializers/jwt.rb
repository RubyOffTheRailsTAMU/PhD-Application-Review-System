require 'jwt'
require 'base64'

JWT_ALGORITHM = 'RS256'
# JWT_PRIVATE_KEY = OpenSSL::PKey::RSA.new(File.read(Rails.root.join('private_key.pem')))
JWT_PRIVATE_KEY = OpenSSL::PKey::RSA.new(Base64.strict_decode64(ENV['PRIVATE_KEY']))
