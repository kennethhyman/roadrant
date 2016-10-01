class Driver < ApplicationRecord
	validates :license_plate, presence: true, uniqueness: true
	has_many :reviews
end
