class Location < ApplicationRecord
	#ensures both longitude and latitude are submitted
	validates :longitude, presence: true 
	validates :latitude, presence: true
	
end
