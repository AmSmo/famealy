class CreateSuppliedIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :supplied_ingredients do |t|
      t.belongs_to :ingredient, null: false, foreign_key: true
      t.belongs_to :potluck, null: false, foreign_key: true
      t.integer :quantity
      t.integer :user_ingredient

      t.timestamps
    end
  end
end
