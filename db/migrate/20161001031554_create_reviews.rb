class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.references :driver, foreign_key: true
      t.string :rating
      t.string :description
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
