class TasksController < ApplicationController
    before_action :set_task, only: %i[ show edit update destroy ]
    before_action :require_user

    # GET /tasks or /tasks.json
    def index
        @reviews = Review.where(user_netid: current_user.user_netid)

        @applicant_names = {}
        @reviews.each do |review|
          applicant_id = review.applicant_id
          application_info = SearchService.search(query: "*application_cas_id=#{applicant_id}", field: nil, token: session[:jwt_token])[0]
          if application_info
            @applicant_names[applicant_id] = application_info["application_name"]
          else
            @applicant_names[applicant_id] = "Dummy Name" # Set a default name if application_info is nil
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