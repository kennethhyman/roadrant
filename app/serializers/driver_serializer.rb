class DriverSerializer < ActiveModel::Serializer
  #sets up the attributes rails will return via json
  #currently not actually giving data for the location model
  attributes :id, :license_plate, :reviews
  #review has_one location, but is only sending a reference ID
  #has_many :reviews
end