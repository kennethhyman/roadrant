class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :update, :destroy]

  # GET /locations
  def index
    @locations = Location.all

    render json: @locations
  end

  # GET /locations/1
  def show
    render json: @location
  end

  # POST /locations
  def create
    @location = Location.new(location_params)

    if @location.save
      if @location.review.is_bad?
        bucket = InitialState::Bucket.new 'qA5JfSLnp9UnpO2lfxlkV5Vh8YFhgOVr', '8BF5V777ESGB' # Bucket for bad drivers
      else
        bucket = InitialState::Bucket.new 'qA5JfSLnp9UnpO2lfxlkV5Vh8YFhgOVr', 'V49S45P4FGA5' # And good drivers
      end

      # Dump our data in InitialState for analysis
      bucket.dump 'location', "#{@location.longitude.to_f},#{@location.latitude.to_f}"

      render json: @location, status: :created, location: @location
    else
      render json: @location.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /locations/1
  def update
    if @location.update(location_params)
      render json: @location
    else
      render json: @location.errors, status: :unprocessable_entity
    end
  end

  # DELETE /locations/1
  def destroy
    @location.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def location_params
      params.require(:location).permit(:longitude, :latitude, :review_id)
    end
end
