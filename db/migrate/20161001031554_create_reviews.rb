class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
    	#associates to driver
      t.references :driver, foreign_key: true
      	#records rating
      t.boolean :bad_driver
      	#description of the event
      t.string :description
      	#records location using geo location
      # t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
