# frozen_string_literal: true

require 'rspec/expectations'
World(RSpec::Matchers)
require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'

World(Capybara::DSL)

When('I want to see all reviews') do
  uri = URI('http://127.0.0.1:3000/reviews')
  response = Net::HTTP.get_response(uri)
  @content_type = response['Content-Type']
  @response_code = response.code.to_i
  @response_body = begin
    response.body
  rescue StandardError
    nil
  end
end

# * The response status should be 200
Then('The response status should be {int}') do |status_code|
  expect(@response_code).to eq(status_code)
end

And('I can see all reviews') do
  visit '/reviews'
  expect(page).to have_css('#reviews')
  # within('#reviews') do
  #   expect(page).to have_css('[id^="review_"]')
  # end
end

And(/I fill in review "(.*)" with rating "(.*)" and assistantship "(.*)"/) do |review, rating, assistantship|
  fill_in 'review_info', with: review
  choose "rating_#{rating}"
  check assistantship.downcase.to_s
end
