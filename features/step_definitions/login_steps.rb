require 'rspec/expectations'
World(RSpec::Matchers)

Given('I am a user') do
    # pending # Write code here that turns the phrase above into concrete actions
end

When('I want to log into the site with email {string}') do |email|
    expect(email).to eq('abc@tamu.edu')
    # TODO: Delete the line above and write your own code
    # TODO: Try login, and get the response, if able to login `@logedIn=true`, else `@logedIn=false`
    # TODO: You can use more details for testing form the login response and add more testing steps
end

Then('I should be able to log in') do
    expect(@logedIn).to eq(true)
end

Then('I should not be able to log in') do
    expect(@logedIn).to eq(false)
end
