class Delivery < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :closing_at, presence: true
  validate :future_date

  def status
    if delivered_at.present?
      "done"
    elsif DateTime.now < closing_at
      "pending"
    else
      "in progress"
    end
  end

  def future_date
     errors.add(:closing_at, "can't be in the past") if closing_at.past?
  end
end
