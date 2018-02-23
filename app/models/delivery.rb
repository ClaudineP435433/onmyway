class Delivery < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :closing_at, presence: true

  enum status: [ :pending, :in_progress, :done ]
  scope :ordered_by_status, -> { order(status: :asc) }

  include PgSearch
  pg_search_scope :search_by_address,
  associated_against: {
    restaurant: [ :address ]
  },
  using: {
    tsearch: { prefix: true }
  }

end
