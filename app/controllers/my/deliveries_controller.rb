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

end
