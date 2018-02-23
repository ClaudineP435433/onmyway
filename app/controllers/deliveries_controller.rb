class DeliveriesController < ApplicationController

  before_action :find_delivery, only: [:show, :done]


  def index
    if params[:query].present?
      sql_query = " \
      deliveries.status = 0 \
      AND (restaurants.address @@ :query \
      OR restaurants.name @@ :query) \
      "
      @deliveries = Delivery.joins(:restaurant).where(sql_query, query: "%#{params[:query]}%")
    else
      @deliveries = Delivery.where(status: [:pending])
    end

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
    @delivery = current_user.deliveries.new(delivery_params)
    if params[:datetime].empty?
      render :new
    else
      @delivery.closing_at = DateTime.parse(params[:datetime])
      # @delivery.user = current_user unneeded due to above line syntax
      if @delivery.save
        @delivery.pending!
        @delivery.save
        redirect_to my_deliveries_path
      else
        render :new
      end
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
