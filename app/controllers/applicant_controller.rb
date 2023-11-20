class ApplicantController < ApplicationController
    def index
        # begin
          @result = SearchService.search(query: "*application_cas_id=#{params[:cas_id]}", field: nil, token: session[:jwt_token])[0]
      
          if @result
            @other_reviewers = Review.where(applicant_id: @result["application_cas_id"], status: "completed").where.not(user_netid: current_user.user_netid)
          else
            @other_reviewers = []
            flash.now[:alert] = "No data found for the specified CAS ID."
          end
      
        # rescue => e
        #   Rails.logger.error "Failed to fetch data for CAS ID #{params[:cas_id]}: #{e.message}"
        #   @other_reviewers = []
        #   flash.now[:alert] = "There was a problem fetching application data. Please try again later."
        # end
      end    
end