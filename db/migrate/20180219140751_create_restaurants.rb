class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :picture
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
