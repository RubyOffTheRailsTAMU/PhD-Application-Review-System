class TasksController < ApplicationController
    before_action :set_task, only: %i[ show edit update destroy ]
    before_action :require_user

    def index
      @reviews = Review.where(user_netid: current_user.user_netid)
    
      @applicant_names = {}
      @reviews.each do |review|
        applicant_id = review.applicant_id
        
        begin
          # Fetch application info
          application_info = SearchService.search(query: "*application_cas_id=#{applicant_id}", field: nil, token: session[:jwt_token])[0]
          @applicant_names[applicant_id] = application_info ? application_info["application_name"] : "Default Name"
          
        rescue => e
          # Log the error, set a default name, and set a flash message
          Rails.logger.error "Failed to fetch application info for applicant_id #{applicant_id}: #{e.message}"
          @applicant_names[applicant_id] = "N/A"
          flash.now[:alert] = "There was a problem fetching some application data. Please try again later."
        end
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
        @task = Task.find(params[:id])
    end
    # Only allow a list of trusted parameters through.
    def task_params
        params.require(:task).permit(:status, :user_id, :applicant_id)
    end

    end