class AddUserIngredientIdtoSupplied < ActiveRecord::Migration[6.0]
  def change
    add_reference :supplied_ingredients, :ingredient
    add_reference :supplied_ingredients, :user
    remove_column :supplied_ingredients, :user_ingredient
  end
end
