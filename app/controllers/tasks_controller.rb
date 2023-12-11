class TasksController < ApplicationController
    before_action :require_user

    def index
      @reviews = Review.where(user_netid: current_user.user_netid)
    
      @applicant_names = {}
      @reviews.each do |review|
        applicant_id = review.applicant_id
        
        begin
          # Fetch application info
          application_info = SearchService.search(query: "*cas_id=#{applicant_id}", field: "cas_id", token: session[:jwt_token])[0]
          @applicant_names[applicant_id] = application_info ? application_info["first_name"] +" "+ application_info["last_name"] : "Default Name"
          
        rescue => e
          # Log the error, set a default name, and set a flash message
          Rails.logger.error "Failed to fetch application info for applicant_id #{applicant_id}: #{e.message}"
          @applicant_names[applicant_id] = "N/A"
          flash.now[:alert] = "There was a problem fetching some application data. Please try again later."
        end
      end
    end
    end