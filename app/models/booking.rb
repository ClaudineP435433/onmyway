class Booking < ApplicationRecord
  belongs_to :delivery
  belongs_to :user
  validates :content, presence: true
end
