class ReviewSerializer < ActiveModel::Serializer
	#will return id, description, rating, location, and driver for any given review
	attributes :id, :description, :bad_driver, :driver, :location
end
