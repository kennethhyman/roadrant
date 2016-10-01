class Location < ApplicationRecord
	#ensures both longitude and latitude are submitted
	validates_presence_of :longitude, :latitude
	belongs_to :review

end
