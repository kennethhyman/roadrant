#Just some test data used to populate the database for testing purposes

driver1 = Driver.create(license_plate: "abc 1234")
driver2 = Driver.create(license_plate: "abc 3456")
driver3 = Driver.create(license_plate: "abc 6789")

location1 = Location.create(longitude: 123.456789, latitude: 123.456789)

review1 = Review.create(bad_driver: true, driver: driver1, description: "This guy threw an entire burrito at me while I was driving! I punted his dog off a bridge!", location: location1)