require 'base64'

# 编码私钥
encoded_private_key = Base64.strict_encode64('private_key.pem')

puts "qwe: " + encoded_private_key

# 编码公钥
encoded_public_key = Base64.strict_encode64('public_key.pem')

puts "rtrt: "+encoded_public_key
