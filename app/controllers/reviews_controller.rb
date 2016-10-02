class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :update, :destroy]

  # GET /reviews
  def index
    @reviews = Review.all

    render json: @reviews
  end

  # GET /reviews/1
  def show
    render json: @review
  end

  # POST /reviews
  def create
    @review = Review.new(review_params)

    if @review.save
      lic_plate = @review.driver.license_plate.upcase.gsub(/\s+/, '')

      user = Rails.application.secrets.yak_user
      app = Rails.application.secrets.yak_app
      secret = Rails.application.secrets.yak_secret

      yikyak = YikYak.new user, app, secret

      msg = @review.is_bad? ? "PissedOffBy#{lic_plate}" : "MadeMyDay#{lic_plate}"
      yikyak.set_status msg

      render json: @review, status: :created, location: @review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reviews/1
  def update
    if @review.update(review_params)
      render json: @review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reviews/1
  def destroy
    @review.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def review_params
      params.require(:review).permit(:driver_id, :bad_driver, :description)
    end
end
