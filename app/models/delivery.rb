class Delivery < ApplicationRecord
  belongs_to :restaurant
  has_many :bookings, dependent: :destroy
  validates :closing_at, presence: true
end
