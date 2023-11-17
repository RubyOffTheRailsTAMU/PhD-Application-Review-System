class ReviewsController < ApplicationController
  before_action :require_user
  before_action :set_review, only: %i[ show edit update destroy ]
  protect_from_forgery with: :null_session

  # POST /reviews or /reviews.json
  def create
    @review = Review.new(review_params)
    if saved?
      @review.status = "completed"
    else
      @review.status = "inprogress"
    end

    respond_to do |format|
      if @review.save
        # format.html { redirect_to review_url(@review), notice: "Review was successfully created." }
        flash[:notice] = "Review was successfully created."
        format.html { redirect_to "/application?cas_id=#{@review.applicant_id}" }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def assign
    puts review_params
    # @review = Review.new(review_params)
    # @review.status = "inprogress"
    # respond_to do |format|
    #   if @review.save
    #     # format.html { redirect_to review_url(@review), notice: "Review was successfully created." }
    #     flash[:notice] = "Review was successfully created."
    #     format.html { redirect_to "/application?cas_id=#{params[:applicant_id]}" }
    #     format.json { render :show, status: :created, location: @review }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @review.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /reviews/1 or /reviews/1.json
  def update
    respond_to do |format|
      if saved?
        @review.status = "completed"
      else
        @review.status = "inprogress"
      end
      if @review.update(review_params)
        # format.html { redirect_to review_url(@review), notice: "Review was successfully updated." }
        flash[:notice] = "Review was successfully updated."
        format.html { redirect_to "/application?cas_id=#{@review.applicant_id}" }
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
      params.permit(:review_id, :user_netid, :applicant_id, :review_info, :rating, :gar, :gat, :created_at, :updated_at)
    end

    def saved?
      params[:commit] == "Submit"
    end
end
