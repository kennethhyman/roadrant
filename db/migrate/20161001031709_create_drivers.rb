class CreateDrivers < ActiveRecord::Migration[5.0]
  def change
    create_table :drivers do |t|
      t.string :license_plate

      t.timestamps
    end
  end
end
