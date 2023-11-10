require 'omniauth'
require 'rspec/expectations'
World(RSpec::Matchers)

Given(/the following users exist/) do |users|
  users.hashes.each do |user|
    User.create user
  end
end

When(/I am on the log in page/) do
  visit root_path
end

When(/I click "(.*)"/) do | button |
  click_button(button)
end

When(/I want to log into the site with "(.*)" as "(.*)" and "(.*)" as "(.*)"/) do |username, name, password, pwd|
  fill_in(username, with: name)
  fill_in(password, with: pwd)
end

Then (/I should not be able to log in/) do
  expect(page).to have_current_path(root_path)
end

Then (/I should be able to log in/) do
  expect(page).to have_current_path('/home')
end

Given(/I want to log into the site with email "(.*)" using Google/) do | email |
  page.driver.browser.set_cookie("stub_user_email=#{email}")
  page.driver.browser.set_cookie("stub_user_token=testtokencucumber")
end

When(/I follow link "(.*)"/) do |link|
  # click_link(link)
  visit link
end

When(/I get redirected to "(.*)"/) do | link |
  sleep(5)
  expect(page).to have_current_path(link)
end

Then(/I should see "(.*)"/) do |string|
  expect(page).to have_content(string)
end

When(/I create a user with netid "(.*)" username "(.*)"/) do | netid, username |
  fill_in("User NetID", with: netid)
  fill_in("Username", with: username)
end