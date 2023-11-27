# frozen_string_literal: true

require 'rspec/expectations'
World(RSpec::Matchers)
require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'

World(Capybara::DSL)
Capybara.current_driver = :webkit

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

And ('I select the first checkbox') do
  first('tbody#applicationList input[type="checkbox"]').click
end

And("I select {string} from the dropdown") do |option_name|
  select(option_name, from: 'userDropdown')
end

And ('I select the first checkbox') do
  first('tbody#applicationList input[type="checkbox"]').click
end

And("I select {string} from the dropdown") do |option_name|
  select(option_name, from: 'userDropdown')
end

#* The response status should be 200
Then('The response status should be {int}') do |status_code|
  expect(@response_code).to eq(status_code)
end

And(/I forcibly click the "(.*)" button/) do |button_text|
  page.execute_script("document.getElementById('#{button_text.downcase.gsub(' ', '')}').click();")
end

And('I can see all reviews') do
  visit '/reviews'
  expect(page).to have_css('#reviews')
  # within('#reviews') do
  #   expect(page).to have_css('[id^="review_"]')
  # end
end

And(/I fill in review "(.*)" with rating "(.*)" and assistantship "(.*)"/) do |review, rating, assistantship|
  fill_in 'reviewInput', with: review
  # choose "rating_#{rating}" 
  find(".fa[data-rating='#{rating}']").click
  # TODO add this back in
  # check "#{assistantship.downcase}"
end

Then(/I should see submitted/) do |string|
  expect(page).to have_selector(:xpath, "//*[contains(., 'Your review has been submitted successfully!')]", visible: :all)
end


Then(/I should see saved/) do |string|
  expect(page).to have_selector(:xpath, "//*[contains(., 'Your review has been saved successfully!')]", visible: :all)
end
