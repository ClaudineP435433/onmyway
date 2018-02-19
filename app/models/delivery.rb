class Delivery < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :closing_at, presence: true
end
