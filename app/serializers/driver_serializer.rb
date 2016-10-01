class DriverSerializer < ActiveModel::Serializer
  attributes :id, :license_plate, :reviews
  #has_many :reviews
end
