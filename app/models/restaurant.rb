class Restaurant < ApplicationRecord
  belongs_to :category
  has_many :deliveries
  validates :name, uniqueness: { scope: :address }


  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  mount_uploader :picture, PhotoUploader
end
