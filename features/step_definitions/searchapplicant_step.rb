# frozen_string_literal: true

require 'rspec/expectations'
World(RSpec::Matchers)
require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'

World(Capybara::DSL)

Given('I have an applicants query: {string}') do |string|
  @name = string
end

When(/I search the applicant field "(.*)"/) do |string|
  query = @name

  fill_in 'query', with: query
  select string, from: 'field'
  click_button 'Search'
end

Then('the response status should be {int}') do |int|
  expect(response.status).to eq(int)
end
