class DeliveriesController < ApplicationController

  before_action :find_delivery, only: [:show, :done]

  def index
    @deliveries = Delivery.all
    @restaurants = Restaurant.where.not(latitude: nil, longitude: nil)

    @markers = @restaurants.map do |restaurant|
      {
        lat: restaurant.latitude,
        lng: restaurant.longitude
      }
    end
  end

  def show
    @booking = Booking.new
  end

  def new
    @delivery = Delivery.new
  end

  def create
    @delivery = current_user.deliveries.new(delivery_params)
    # @delivery.user = current_user unneeded due to above line syntax
    if @delivery.save
      redirect_to @delivery
    else
      render :new
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
