class Review < ApplicationRecord
  validates :driver_id, :location_id, :rating, :description, presence: true
  has_one :location
  belongs_to :driver
end
