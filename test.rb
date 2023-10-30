require 'base64'

encoded_private_key = Base64.strict_encode64('private_key.pem')

puts "qwe: " + encoded_private_key


encoded_public_key = Base64.strict_encode64('public_key.pem')

puts "rtrt: "+encoded_public_key
