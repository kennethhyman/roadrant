class Review < ApplicationRecord
	#ensures the presence of all of the elements stored in the database
  validates :driver_id, :location_id, :rating, :description, presence: true
  has_one :location
  belongs_to :driver
end
