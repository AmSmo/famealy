class CreateRecipesPotlucks < ActiveRecord::Migration[6.0]
  def change
    create_table :potluck_recipes do |t|
      t.belongs_to :recipe, null: false, foreign_key: true
      t.belongs_to :potluck, null: false, foreign_key: true
      t.time :time
      

      t.timestamps
    end
  end
end
