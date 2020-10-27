class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :spoon_id
      t.string :description
      t.integer :time
      t.float :price
      t.string :directions
      t.float :cost

      t.timestamps
    end
  end
end
