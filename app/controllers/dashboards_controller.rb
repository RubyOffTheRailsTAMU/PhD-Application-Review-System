# frozen_string_literal: true

class DashboardsController < ApplicationController
  def show
    @committee_members = User.where(user_level: 'committee_member')
    
    @committee_reviews = {}
    @applicant_names = {}

    @committee_members.each do |member|
      reviews = Review.where(user_netid: member.user_netid)
      @committee_reviews[member.user_netid] = reviews

      # Fetch and store applicant names for each review
      reviews.each do |review|
        begin
          unless @applicant_names.key?(review.applicant_id)
            application_info = SearchService.search(query: "*application_cas_id=#{review.applicant_id}", field: "cas_id", token: session[:jwt_token])[0]
            @applicant_names[review.applicant_id] = application_info ? application_info["application_name"] : "Default Name"
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
