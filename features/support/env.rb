require 'simplecov'

puts "SimpleCov is loaded!"

SimpleCov.start do
  # add_group 'Models', 'app/models'
  add_group 'Controllers', 'app/controllers'
  # add_group 'Helpers', 'app/helpers'
  # add_group 'Libraries', 'lib'
end

require 'cucumber'
