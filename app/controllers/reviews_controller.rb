require 'json'
class ReviewsController < ApplicationController
  before_action :require_user
  before_action :set_review, only: %i[show edit update destroy]
  skip_before_action :verify_authenticity_token
  # protect_from_forgery with: :null_session

  # POST /reviews or /reviews.json
  def create
    @review = Review.new(review_params)
    @review.rating = 0 unless @review.rating
    # if @review.status=="assigned"
    #   puts "assigned"
    # if saved?
    #   @review.status = "completed"
    # else
    #   @review.status = "inprogress"
    # end

    respond_to do |format|
      if @review.save
        # format.html { redirect_to review_url(@review), notice: "Review was successfully created." }
        flash[:notice] = 'Review was successfully created.'
        format.html { redirect_to "/applicant?cas_id=#{@review.applicant_id}" }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def assign
    tmp = JSON.parse(request.body.string)
    puts tmp
    puts tmp['user_id']
    puts tmp['application_ids']
    for applicant_id in tmp['application_ids']
      not_exists = Review.where(user_netid: tmp['user_id'], applicant_id:).blank?
      puts not_exists

      next unless not_exists

      puts 'here'
      Review.new(user_netid: tmp['user_id'], applicant_id:, status: 'assigned').save
      flash[:notice] = 'Review was successfully assigned.'
    end
    render json: { status: 'success', message: 'Review(s) assigned successfully' }
  end

  def random_assign
    tmp = JSON.parse(request.body.string)
    # randomly assign applications to all users
    # get all users
    users = User.all
    # get all applications
    puts "token in random assign #{session[:jwt_token]}"
    applications = SearchService.searchall(token: session[:jwt_token])
    puts applications
    # randomly assign applications to users
    for application in applications
      # randomly select a user with the least number of assigned applications
      user = users.sample
      # check if the user has already reviewed the application
      not_exists = Review.where(user_netid: user.user_netid, applicant_id: application.application_cas_id).blank?
      # if the user has not reviewed the application, assign the application to the user
      if not_exists
        Review.new(user_netid: user.user_netid, applicant_id: application.application_cas_id,
                   status: 'assigned').save
      end
    end
    flash[:notice] = 'Review(s) assigned successfully.'
    render json: { status: 'success', message: 'Review(s) assigned successfully' }
    redirect_to '/home'
  end

  # PATCH/PUT /reviews/1 or /reviews/1.json
  def update
    respond_to do |format|
      # if @review.status=="assigned"
      # if saved?
      #   @review.status = "completed"
      # else
      #   @review.status = "inprogress"
      # end
      if @review.update(review_params)
        puts(review_params)
        # format.html { redirect_to review_url(@review), notice: "Review was successfully updated." }
        flash[:notice] = 'Review was successfully updated.'
        format.html { redirect_to "/applicant?cas_id=#{@review.applicant_id}" }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = Review.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def review_params
    # params.require(:review).permit(:review_id, :user_netid, :applicant_id, :review_info, :rating, :created_at, :updated_at)
    params.permit(:review_id, :user_netid, :applicant_id, :review_info, :rating, :gar, :gat, :status, :created_at,
                  :updated_at)
  end
end
