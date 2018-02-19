class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.text :content
      t.references :delivery, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
