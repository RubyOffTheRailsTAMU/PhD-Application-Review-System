require 'rspec/expectations'
World(RSpec::Matchers)
require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'

require 'capybara'
require 'capybara/dsl'

World(Capybara::DSL)

Given('I have applicants name: {string}') do |string|
  @name = string
end

When('I search the applicant by sending a GET request to database') do
  query = @name
  field = 'Name'

  visit '/searches'
  fill_in 'query', with: query
  select field, from: 'field'
  click_button 'Search'
end

Then('the response status should be {int}') do |int|
  expect(response.status).to eq(int)
end
