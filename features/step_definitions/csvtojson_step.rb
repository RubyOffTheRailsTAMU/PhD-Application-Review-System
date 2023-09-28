require 'rspec/expectations'
World(RSpec::Matchers)

#* Test API URL
When('I send a GET request to {string}') do |url|
  uri = URI(url)
  response = Net::HTTP.get_response(uri)
  @content_type = response['Content-Type']
  @response_code = response.code.to_i
  @response_body = response.body rescue nil
end

#* The response status should be 200
Then('the response status should be {int}') do |status_code|
  expect(@response_code).to eq(status_code)
end

#* The response should be a valid JSON
Then('the response should be a valid JSON') do
  expect(@content_type).to include('application/json')
  expect { JSON.parse(@response_body) }.not_to raise_error
end