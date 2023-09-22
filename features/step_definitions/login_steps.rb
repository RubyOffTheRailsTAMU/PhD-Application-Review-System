Given(/I am a user/) do
    expect(true).to eq(true)
end

When('When I want to log into the site with email {string}') do |email|
    # OmniAuth.config.test_mode = true
    # OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
    #     :provider => "google_oauth2",
    #     :uid => "7148",
    #     :info => {
    #       :name => "abc Stark",
    #       :email => "abc@tamu.edu"
    #     },
    #     :credentials => {
    #       :token => "token",
    #       :refresh_token => "refresh token"
    #     }
    #   })
      
    #   OmniAuth.config.test_mode = false
end
