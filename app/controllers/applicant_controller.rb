class ApplicantController < ApplicationController
  def index
    @result = SearchService.search(query: "*cas_id=#{params[:cas_id]}", field: "cas_id", token: session[:jwt_token])[0]
    puts @result
    # Retrieve reviews for the applicant
    @other_reviewers = Review.where(applicant_id: @result["cas_id"], status: "completed").where.not(user_netid: current_user.user_netid)
  end
end
