require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
    before do
    OmniAuth.config.test_mode = true
    # Create a user with all required fields
    @user = User.create!(user_netid: "some_netid", user_name: "admin", user_email: "admin@example.com",user_level:"admin", password: "password", password_confirmation: "password")
    end

    after do
    # Only attempt to destroy the user if it was successfully created
    @user.destroy if @user
    end

  describe "POST #create" do
    context "when admin credentials are correct" do
      it "sets session values and redirects to home" do
        post :create, params: { session: { user_name: "admin", password: "password" } }
        
        expect(session[:user_token]).to eq("admin_token_placeholder")
        expect(session[:user_email]).to eq("admin@example.com")
        expect(session[:jwt_token]).not_to be_nil
        expect(response).to redirect_to('/home')
      end
    end

    context "when admin credentials are incorrect" do
      it "sets an alert and redirects to root path" do
        post :create, params: { session: { user_name: "admin", password: "wrong_password" } }
        
        expect(session[:alert]).to eq("Wrong Admin Credentials")
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
