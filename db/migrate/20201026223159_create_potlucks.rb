class CreatePotlucks < ActiveRecord::Migration[6.0]
  def change
    create_table :potlucks do |t|
      t.string :name
      t.string :location
      t.date :date

      t.timestamps
    end
  end
end
