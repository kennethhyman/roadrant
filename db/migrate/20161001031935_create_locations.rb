class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
    	#records location as longitude and latitude
      t.decimal :longitude, precision: 9, scale: 6
      t.decimal :latitude, precision: 9, scale: 6

      t.references :review, foreign_key: true
      t.timestamps
    end
  end
end
