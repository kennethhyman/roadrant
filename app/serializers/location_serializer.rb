class LocationSerializer < ActiveModel::Serializer
  #sets up the json to return the longitude and latitude when prompted
  attributes :id, :longitude, :latitude
end
