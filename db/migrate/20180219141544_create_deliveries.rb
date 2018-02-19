class CreateDeliveries < ActiveRecord::Migration[5.1]
  def change
    create_table :deliveries do |t|
      t.datetime :closing_at
      t.datetime :delivered_at
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
