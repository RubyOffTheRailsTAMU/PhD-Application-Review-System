
require 'jwt'
require 'base64'

encoded_private_key = Base64.strict_encode64('private_key.pem')

puts "qwe: " + encoded_private_key


encoded_public_key = Base64.strict_encode64('public_key.pem')

puts "rtrt: "+encoded_public_key


jwt_public_key = Base64.strict_decode64(encoded_public_key)
jwt_private_key = Base64.strict_decode64(encoded_private_key)

puts "Private:"
puts jwt_private_key
puts "Public: "
puts jwt_public_key

puts "read"
puts File.read('private_key.pem')


JWT_PRIVATE_KEY = OpenSSL::PKey::RSA.new(Base64.strict_decode64(encoded_private_key))
puts "JWT"
puts JWT_PRIVATE_KEY