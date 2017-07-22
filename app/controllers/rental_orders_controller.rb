class RentalOrdersController < ApplicationController
  before_action :set_rental_order, only: [:show, :edit, :update, :destroy]

  # GET /rental_orders
  # GET /rental_orders.json
  def index
    @rental_orders = RentalOrder.all
  end

  # GET /rental_orders/1
  # GET /rental_orders/1.json
  def show
  end

  # GET /rental_orders/new
  def new
    @rental_order = RentalOrder.new
  end

  # GET /rental_orders/1/edit
  def edit
  end

  # POST /rental_orders
  # POST /rental_orders.json
  def create
    @rental_order = RentalOrder.new(rental_order_params)

    respond_to do |format|
      if @rental_order.save
        format.html { redirect_to @rental_order, notice: 'Rental order was successfully created.' }
        format.json { render :show, status: :created, location: @rental_order }
      else
        format.html { render :new }
        format.json { render json: @rental_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rental_orders/1
  # PATCH/PUT /rental_orders/1.json
  def update
    respond_to do |format|
      if @rental_order.update(rental_order_params)
        format.html { redirect_to @rental_order, notice: 'Rental order was successfully updated.' }
        format.json { render :show, status: :ok, location: @rental_order }
      else
        format.html { render :edit }
        format.json { render json: @rental_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rental_orders/1
  # DELETE /rental_orders/1.json
  def destroy
    @rental_order.destroy
    respond_to do |format|
      format.html { redirect_to rental_orders_url, notice: 'Rental order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rental_order
      @rental_order = RentalOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rental_order_params
      params.require(:rental_order).permit(:parking_address_id, :user_id, :rentStart, :rentEnd, :orderTotal, :status)
    end
end
