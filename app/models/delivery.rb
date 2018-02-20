class Delivery < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :closing_at, presence: true

  def status
    if delivered_at.present?
      "done"
    elsif DateTime.now < closing_at
      "pending"
    else
      "in progress"
    end
  end
end
