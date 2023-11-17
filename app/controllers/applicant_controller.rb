class ApplicantController < ApplicationController
    def index
        @result = SearchService.search(query: "*application_cas_id=#{params[:cas_id]}", field: nil, token: session[:jwt_token])[0]

        # Retrieve reviews for the applicant
        @other_reviewers = Review.where(applicant_id: @result["application_cas_id"], status: "completed").where.not(user_netid: current_user.user_netid)
    end
end