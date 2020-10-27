class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.string :name
      t.string :location
      t.date :start_date
      t.date :end_date
      t.float :cost

      t.timestamps
    end
  end
end
