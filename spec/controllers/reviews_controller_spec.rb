require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
    let(:valid_attributes) {
        {
          review_id: 1,
          user_netid: "user123",
          applicant_id: "applicant123",
          review_info: "Sample review information",
          rating: 5,
          status: "inprogress",
          gar: true,
          gat: false
        }
      }
      
      let(:invalid_attributes) {
        {
          review_id: nil,
          user_netid: nil,
          applicant_id: nil,
          review_info: "",
          rating: -1,  # Assuming rating should be a positive number
          status: nil,
          gar: nil,
          gat: nil
        }
      }
  
    let(:valid_session) { 
        {
            user_email: "admin.phd@tamu.edu",
            user_token: "admin_token_placeholder"
        }
    }

    describe "POST #create" do
        context "with valid params" do
            it "creates a new Review" do
              expect {
                post :create, params: valid_attributes , session: valid_session
              }.to change(Review, :count).by(1)
          
              expect(assigns(:review).errors.full_messages).to be_empty
            end
        end
      
        # context "with invalid params" do
        #   it "does not create a new Review" do
        #     expect {
        #       post :create, params:  invalid_attributes , session: valid_session
        #     }.to change(Review, :count).by(0)
        #   end
      
        #   it "renders the 'new' template" do
        #     post :create, params: invalid_attributes , session: valid_session
        #     expect(response).to be_unprocessable
        #   end
        # end
    end
    
    describe "PUT #update" do
        let(:new_attributes) {
            {
                review_id: 1,
                user_netid: "user123",
                applicant_id: "applicant123",
                review_info: "Sample review information changed",
                rating: 5,
                status: "inprogress",
                gar: true,
                gat: false
            }
          }
      
        context "with valid params" do
          it "updates the requested review" do
            review = Review.create! valid_attributes
            put :update, params: { id: review.to_param, review: new_attributes }, session: valid_session
            review.reload
            # Add expectations for updated attributes
          end
      
          it "redirects to the review" do
            review = Review.create! valid_attributes
            put :update, params: { id: review.to_param, review: new_attributes }, session: valid_session
            expect(response).to redirect_to("/applicant?cas_id=#{review.applicant_id}")
          end
        end
      
        # context "with invalid params" do
        #   it "renders the 'edit' template" do
        #     review = Review.create! valid_attributes
        #     put :update, params: { id: review.to_param, review: invalid_attributes }, session: valid_session
        #     expect(response).to be_unprocessable
        #   end
        # end
    end
    
    describe "POST #assign" do
        let(:user_id) { "user123" }
        let(:application_ids) { ["app1", "app2", "app3"] }
      
        before do
          # Create necessary data or mock objects
          # For instance, create a User with user_id if the database expects it
        end
      
        it "assigns reviews to users" do
          # Prepare request body
          request_body = { user_id: user_id, application_ids: application_ids }.to_json
      
          # Make a POST request to the assign action with JSON payload
          post :assign, body: request_body, as: :json
      
          # Check if reviews have been correctly assigned
          application_ids.each do |app_id|
            expect(Review.find_by(user_netid: user_id, applicant_id: app_id)).not_to be_nil
          end
      
          # Optionally, check for flash messages or response status if relevant
          expect(flash[:notice]).to eq("Review was successfully assigned.")
        end
      end
  end