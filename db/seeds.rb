#Just some test data used to populate the database for testing purposes
class SeedFaker
	def fake_driver
		Driver.create(license_plate: fake_plate)
	end

	def fake_location
		location = fake_coords
		Location.create(longitude: location[:longitude], latitude: location[:latitude])
	end

	def fake_review(driver, location)
		Review.create(description: fake_description, bad_driver: asshole_spoof, driver: driver, location: location)
		#Review.create(description: fake_description, bad_driver: asshole_spoof, location: location, driver: driver)
	end
	private
	def fake_description
		Faker::Lorem.sentence
	end
	def fake_plate
		length = [6, 7].sample
		rand(36 ** length).to_s(36)
	end
	def fake_coords
				{latitude: rand(35.950000000...40.000000000), longitude: rand(-84.020000000...-83.850000000)}
	end
	def asshole_spoof
		[true, true, true, true, true, false].sample
	end
end

seeder = SeedFaker.new
locations = Array.new
drivers = Array.new
reviews = Array.new
20.times do 
	drivers << seeder.fake_driver
end
50.times do 
	locations << seeder.fake_location
end

100.times do
	driver = drivers.sample
	location = locations.sample
	reviews << seeder.fake_review(driver, location)
end


