class Review < ApplicationRecord
	#ensures the presence of all of the elements stored in the database
  validates_presence_of :driver, :location, :bad_driver
  has_one :location
  belongs_to :driver
end
