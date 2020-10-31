class ChangeSuppliedIngredientsToFitUserIngredients < ActiveRecord::Migration[6.0]
  def change
    rename_column :supplied_ingredients, :quantity, :amount
    add_column :supplied_ingredients, :amount_type, :string
  end
end
