require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
    context 'when the email is not in the whitelist' do
        before(:each) do
            OmniAuth.config.test_mode = true
            OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
                :provider => "google_oauth2",
                :uid => "7148",
                :info => {
                    :name => "abc Stark",
                    :email => "abc@tamu.edu"
                },
                :credentials => {
                    :token => "token",
                    :refresh_token => "refresh token"
                }
            })
            request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2] 
        end
        describe "when trying to log in with invalid email id" do
            it 'throws an alert' do
                get :create
                expect(session[:user_token]).to eq(nil)
                expect(session[:user_email]).to eq('abc@tamu.edu')
                expect(session[:alert]).to eq('This user is not allowed access to this site')
                OmniAuth.config.test_mode = false
            end
        end
        describe "when trying to log out" do
            it 'succeeds' do
                get :destroy
            end
        end
    end
    context 'when the email is in the whitelist' do
        before(:each) do
            OmniAuth.config.test_mode = true
            OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
                :provider => "google_oauth2",
                :uid => "7148",
                :info => {
                    :name => "abc Stark",
                    :email => "tanayp@tamu.edu"
                },
                :credentials => {
                    :token => "token",
                    :refresh_token => "refresh token"
                }
            })
            request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2] 
        end
        describe "when trying to log in with valid email id" do
            it 'does not have an alert' do
                get :create
                expect(session[:user_token]).to eq("token")
                expect(session[:user_email]).to eq('tanayp@tamu.edu')
                expect(session[:alert]).to eq(nil)
                OmniAuth.config.test_mode = false
            end
        end
        describe "when trying to log out" do
            it 'succeeds' do
                get :destroy
            end
        end
    end
end
    