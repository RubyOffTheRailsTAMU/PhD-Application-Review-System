class TasksController < ApplicationController
    before_action :set_task, only: %i[ show edit update destroy ]
    before_action :require_user

    # GET /tasks or /tasks.json
    def index
      @tasks = Task.joins(:user).where(users: { user_email: current_user.user_email})
      puts @tasks
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