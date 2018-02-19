class Restaurant < ApplicationRecord
  belongs_to :category
  has_many :deliveries
  validates :name, uniqueness: { scope: :address }
end
