class ParkingAddressesController < ApplicationController
  before_action :set_parking_address, only: [:show, :edit, :update, :destroy]

  # GET /parking_addresses
  # GET /parking_addresses.json
  def index
    @parking_addresses = ParkingAddress.all
  end

  # GET /parking_addresses/1
  # GET /parking_addresses/1.json
  def show
  end

  # GET /parking_addresses/new
  def new
    @parking_address = ParkingAddress.new
  end

  # GET /parking_addresses/1/edit
  def edit
  end

  # POST /parking_addresses
  # POST /parking_addresses.json
  def create
    @parking_address = ParkingAddress.new(parking_address_params)

    respond_to do |format|
      if @parking_address.save
        format.html { redirect_to @parking_address, notice: 'Parking address was successfully created.' }
        format.json { render :show, status: :created, location: @parking_address }
      else
        format.html { render :new }
        format.json { render json: @parking_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parking_addresses/1
  # PATCH/PUT /parking_addresses/1.json
  def update
    respond_to do |format|
      if @parking_address.update(parking_address_params)
        format.html { redirect_to @parking_address, notice: 'Parking address was successfully updated.' }
        format.json { render :show, status: :ok, location: @parking_address }
      else
        format.html { render :edit }
        format.json { render json: @parking_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parking_addresses/1
  # DELETE /parking_addresses/1.json
  def destroy
    @parking_address.destroy
    respond_to do |format|
      format.html { redirect_to parking_addresses_url, notice: 'Parking address was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parking_address
      @parking_address = ParkingAddress.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parking_address_params
      params.require(:parking_address).permit(:user_id, :address, :building, :city, :state, :country, :postcode, :additionalDetails, :monthlyRate, :weeklyRate, :dailyRate, :hourlyRate, :xCoordinates, :yCoordinate, :approval, :features, :status, :availableFrom)
    end
end
