class DriversController < ApplicationController
  before_action :set_driver, only: [:show, :update, :destroy]
  # GET /drivers
  def index
    #Known bugs: Not returning any content other than a reference ID for the location
    @drivers = Driver.includes(reviews: :location)

    render json: @drivers
  end

  # GET /drivers/1
  def show
    render json: @driver
  end

  # POST /drivers
  def create
    render json: Driver.find_or_create_by(license_plate: driver_params[:license_plate])
  end

  # PATCH/PUT /drivers/1
  def update
    if @driver.update(driver_params)
      render json: @driver
    else
      render json: @driver.errors, status: :unprocessable_entity
    end
  end

  # DELETE /drivers/1
  def destroy
    @driver.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_driver
      @driver = Driver.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def driver_params
      params.require(:driver).permit(:license_plate)
    end
end
