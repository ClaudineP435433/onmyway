class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
    @delivery = Delivery.find(params[:delivery_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @delivery = Delivery.find(params[:delivery_id])
    @booking.delivery = @delivery
    @booking.user = current_user
    if @booking.save
      redirect_to delivery_path(params[:delivery_id])
    else
      render "deliveries/show"
    end
  end

private

  def booking_params
    params.require(:booking).permit(:content)
  end

end
