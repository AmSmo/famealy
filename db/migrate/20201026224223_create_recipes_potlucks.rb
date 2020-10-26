class CreateRecipesPotlucks < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes_potlucks do |t|
      t.belongs_to :recipes, null: false, foreign_key: true
      t.belongs_to :potluck, null: false, foreign_key: true
      t.integer :time
      t.datetime :day
      t.float :cost

      t.timestamps
    end
  end
end
