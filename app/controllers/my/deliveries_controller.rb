class My::DeliveriesController < ApplicationController
  def index
    @deliveries = Delivery.where(user_id: current_user)

    @user_delivery_guy = current_user
    @user_delivery_guy_marker = [{ lat: @user_delivery_guy.latitude, lng: @user_delivery_guy.longitude }]

    @usermarkers = @flats.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end

  end

  def done
    @delivery = Delivery.find(params[:id])
    @delivery.delivered_at = DateTime.now
    @delivery.save
    redirect_to my_deliveries_path
  end

end
