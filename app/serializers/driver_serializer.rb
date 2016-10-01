class DriverSerializer < ActiveModel::Serializer
  #sets up the attributes rails will return via json
  attributes :id, :license_plate, :reviews
  #has_many :reviews
end
