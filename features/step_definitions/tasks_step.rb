require 'omniauth'
require 'rspec/expectations'
require 'capybara/dsl'

World(Capybara::DSL)

Given(/the following reviews exist/) do |reviews|
    reviews.hashes.each do |review|
      Review.create review
    end
end

And(/^I check the "(.*)" checkbox/) do |checkbox_id|
  check(checkbox_id)
end