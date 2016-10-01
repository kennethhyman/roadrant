class ReviewSerializer < ActiveModel::Serializer
	attributes :id, :description, :rating, :location, :driver
end
