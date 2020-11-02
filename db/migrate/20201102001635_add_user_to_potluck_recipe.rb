class AddUserToPotluckRecipe < ActiveRecord::Migration[6.0]
  def change
    add_reference :potluck_recipes, :user
  end
end
