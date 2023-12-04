# frozen_string_literal: true

class DashboardsController < ApplicationController
  def show
    # get users who user level is not admin
    @users = User.where.not(user_level: 'admin')
    
    @committee_reviews = {}
    @applicant_names = {}

    @users.each do |member|
      reviews = Review.where(user_netid: member.user_netid)
      @committee_reviews[member.user_netid] = reviews

      # Fetch and store applicant names for each review
      reviews.each do |review|
        begin
          unless @applicant_names.key?(review.applicant_id)
            application_info = SearchService.search(query: "*cas_id=#{review.applicant_id}.0", field: "cas_id", token: session[:jwt_token])[0]
            @applicant_names[review.applicant_id] = application_info ? application_info["Combined name"] : "Default Name"
          end
        rescue => e
          Rails.logger.error "Failed to fetch application info for applicant_id #{review.applicant_id}: #{e.message}"
          @applicant_names[review.applicant_id] = "N/A"
          flash.now[:alert] = "There was a problem fetching some application data. Please try again later."
        end
      end
    end
  end
end
