class DriverSerializer < ActiveModel::Serializer
  #sets up the attributes rails will return via json
  #currently not actually giving data for the location model
  attributes :id, :license_plate, :reviews
  #review has_one location, but is only sending a reference ID
  def reviews
    object.reviews.as_json only: [:bad_driver, :description], include: {
      location: {
        only: [:latitude,:longitude]
      }
    }
  end
end
