class LocationSerializer < ActiveModel::Serializer
  #sets up the json to return the longitude and latitude when prompted
  attributes :id, :longitude, :latitude 
  
  #This is allowing the longitude and latitude 
  #info to be sent from reviews and location, just not 
  #the drivers
end
