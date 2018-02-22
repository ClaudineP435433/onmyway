class Delivery < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :closing_at, presence: true

  enum status: [ :pending, :in_progress, :done ]

  scope :ordered_by_status, -> { order(status: :asc) }


  #def status
   # if delivered_at.present?
    #  "done"
   # elsif DateTime.now < closing_at
   #   "pending"
   # else
   #   "in progress"
   # end
  #end

end
