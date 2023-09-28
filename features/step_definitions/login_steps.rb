
require 'omniauth'
require 'rspec/expectations'
World(RSpec::Matchers)

When(/^I want to log into the site with email "([^"]*)"$/) do |email|
OmniAuth.config.test_mode = true
OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
    :provider => "google_oauth2",
    :uid => "7148",
    :info => {
      :name => "abc Stark",
      :email => email
    },
    :credentials => {
      :token => "token",
      :refresh_token => "refresh token"
    }
  })
#   visit '/'
#   request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]

    expect(email).to eq('tanayp@tamu.edu')
end

Then ('I should not be able to log in') do
    expect(@logedIn).to eq(false)
end