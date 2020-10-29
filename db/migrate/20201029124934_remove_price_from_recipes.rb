class RemovePriceFromRecipes < ActiveRecord::Migration[6.0]
  def change
    remove_column :recipes, :price
  end
end
