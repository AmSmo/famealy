class RemoveIngredientIdfromSupplied < ActiveRecord::Migration[6.0]
  def change
    remove_column :supplied_ingredients, :ingredient_id, :reference
  end
end
