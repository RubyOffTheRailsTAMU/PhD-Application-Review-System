require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  let(:valid_attributes) do
    {
      review_id: 1,
      user_netid: 'user123',
      applicant_id: 'applicant123',
      review_info: 'Sample review information',
      rating: 5,
      status: 'inprogress',
      gar: true,
      gat: false
    }
  end

  let(:invalid_attributes) do
    {
      review_id: nil,
      user_netid: nil,
      applicant_id: nil,
      review_info: '',
      rating: -1,  # Assuming rating should be a positive number
      status: nil,
      gar: nil,
      gat: nil
    }
  end

  let(:valid_session) do
    {
      user_email: 'admin.phd@tamu.edu',
      user_token: 'admin_token_placeholder',
      jwt_token: JwtService.generate_jwt({ user_email: 'admin.phd@tamu.edu',
                                           exp: 24.hours.from_now.to_i })
    }
  end

  describe 'POST #assign' do
    context 'with valid params' do
      it 'assigns a new Review' do
        expect do
          post :assign, body: '{
                "user_id": 1,
                "application_ids": [101, 102, 103]
              }', session: valid_session
        end.to change(Review, :count).by(3)
      end
    end
  end

  describe 'POST #random_assign' do
    context 'with valid params' do
      users = [
        { user_netid: 'shreyasskasetty', user_email: 'shreyasskasetty@tamu.edu', user_name: 'Shreyas Shivakumar',
          user_level: 'comittee_member', password_digest: 'admin' }
        # adxd more users as needed
      ]
      users.each do |user|
        User.create!(user)
      end
      it 'assigns a reviews in roundrobin' do
        expect do
          post :random_assign, body: '{
                "option": ["roundRobin"]
              }', session: valid_session
        end.to change(Review, :count).by_at_least(1)
      end
      it 'assigns a reviews in minthree' do
        expect do
          post :random_assign, body: '{
                "option": ["minThree"]
              }', session: valid_session
        end.to change(Review, :count).by_at_least(1)
      end
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Review' do
        expect do
          post :create, params: valid_attributes, session: valid_session
        end.to change(Review, :count).by(1)

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

  describe 'PUT #update' do
    let(:new_attributes) do
      {
        review_id: 1,
        user_netid: 'user123',
        applicant_id: 'applicant123',
        review_info: 'Sample review information changed',
        rating: 5,
        status: 'inprogress',
        gar: true,
        gat: false
      }
    end

    context 'with valid params' do
      it 'updates the requested review' do
        review = Review.create! valid_attributes
        put :update, params: { id: review.to_param, review: new_attributes }, session: valid_session
        review.reload
        # Add expectations for updated attributes
      end

      it 'redirects to the review' do
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

  describe 'POST #assign' do
    let(:user_id) { 'user123' }
    let(:application_ids) { %w[app1 app2 app3] }

    before do
      # Create necessary data or mock objects
      # For instance, create a User with user_id if the database expects it
    end

    it 'assigns reviews to users' do
      # Prepare request body
      request_body = { user_id:, application_ids: }.to_json

      # Make a POST request to the assign action with JSON payload
      post :assign, body: request_body, as: :json

      # Check if reviews have been correctly assigned
      application_ids.each do |app_id|
        expect(Review.find_by(user_netid: user_id, applicant_id: app_id)).not_to be_nil
      end

      # Optionally, check for flash messages or response status if relevant
      expect(flash[:notice]).to eq('Review was successfully assigned.')
    end
  end
end
