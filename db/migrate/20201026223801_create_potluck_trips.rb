class CreatePotluckTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trip_potlucks do |t|
      t.belongs_to :potluck, null: false, foreign_key: true
      t.belongs_to :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
