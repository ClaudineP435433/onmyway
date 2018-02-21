class My::DeliveriesController < ApplicationController
  def index
    @deliveries = Delivery.where(user_id: current_user)
  end

  def done
    @delivery = Delivery.find(params[:id])
    @delivery.delivered_at = DateTime.now
    @delivery.save
    redirect_to my_deliveries_path
  end

  def show

    # pour l'adresse des clients
    @delivery = Delivery.find(params[:id])
    @bookings = Booking.where(delivery_id: @delivery)
    @users_customers = @bookings.map do |booking|
      User.find(booking.user_id)
    end
    @markers_show = @users_customers.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end

    # pour l'adresse du livreur
    @user_delivery_guy = current_user
    @user_delivery_guy_marker = { lat: @user_delivery_guy.latitude, lng: @user_delivery_guy.longitude }


    # pour l'adresse du resto
    @restaurant = @delivery.restaurant
    @restaurant_marker = { lat: @restaurant.latitude, lng: @restaurant.longitude }


    @markers_show << @user_delivery_guy_marker
    @markers_show << @restaurant_marker
  end


end
