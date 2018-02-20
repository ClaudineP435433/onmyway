class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user_id: current_user)
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
      redirect_to bookings_path
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

private

  def booking_params
    params.require(:booking).permit(:content)
  end

end
