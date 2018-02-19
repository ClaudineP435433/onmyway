class Category < ApplicationRecord
  has_many :restaurants
  CATEGORIES = ["Kebab", "Chinese", "Italian", "French", "Burger", "Japanese", "Snack Bar", "Indian"]
  validates :name, inclusion: {
    in: CATEGORIES,
    message: "%{value} is not a valid category"
  }
end
