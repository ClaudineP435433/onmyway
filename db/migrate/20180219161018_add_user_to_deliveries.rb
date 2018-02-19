class AddUserToDeliveries < ActiveRecord::Migration[5.1]
  def change
    add_reference :deliveries, :user, foreign_key: true
  end
end
