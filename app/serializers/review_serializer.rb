class ReviewSerializer < ActiveModel::Serializer
	#will return id, description, rating, location, and driver for any given review
	attributes :description, :bad_driver

	attribute :location do
		object.location.as_json only: ['latitude', 'longitude']
	end

	attribute :driver do
		object.driver.as_json only: :license_plate
	end
end
