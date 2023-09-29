require 'rspec/expectations'
World(RSpec::Matchers)
require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'

require 'capybara'
require 'capybara/dsl'

World(Capybara::DSL)


Given('I am on the reviews page') do
  visit '/reviews'
end

When('I click "New review"') do
  click_link 'New review'
end

And('I fill in "Text" with "This is a test review"') do
  fill_in 'Review', with: 'This is a test review'
  fill_in 'User netid', with: '1111111'
  fill_in 'Review info', with: 'Review info for test'
  fill_in 'Created at', with: '9/9/2019'
  fill_in 'Updated at', with: '9/9/2019'
end

And('I click "Create Review"') do
  click_button 'Create Review'
end

Then('I should see "Review was successfully created."') do
  expect(page).to have_content('Review was successfully created.')
end
