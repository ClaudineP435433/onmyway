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
    @restaurant = @delivery.restaurant

    @marker = [
      {
        lat: @restaurant.latitude,
        lng: @restaurant.longitude
      }
    ]
  end

  def new
    @delivery = Delivery.new
  end

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.user = current_user
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
