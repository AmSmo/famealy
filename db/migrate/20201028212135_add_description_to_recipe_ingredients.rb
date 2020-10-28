class AddDescriptionToRecipeIngredients < ActiveRecord::Migration[6.0]
  def change
    add_column :recipe_ingredients, :desciption, :string
  end
end
