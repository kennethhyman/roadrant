class Driver < ApplicationRecord
	#prevents duplication or null submissions
	validates :license_plate, presence: true, uniqueness: true
	has_many :reviews
end
