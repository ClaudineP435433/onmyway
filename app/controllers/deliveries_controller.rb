class DeliveriesController < ApplicationController

  before_action :find_delivery, only: [:show, :done]

  def index
    @deliveries = Delivery.all
  end

  def show
    @booking = Booking.new
  end

  def new
    @delivery = Delivery.new
  end

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.user = current_user
    @restaurant = Restaurant.find(params[:restaurant_id])
    @delivery.restaurant = @restaurant
    if @delivery.save
      redirect_to @delivery
    else
      render "deliveries/show"
    end
  end

private

  def find_delivery
    @delivery = Delivery.find(params[:id])
  end

  def delivery_params
    params.require(:delivery).permit(:closing_at, :delivered_at, :restaurant_id)
  end
end
