class ChangeUserIngredientToFloat < ActiveRecord::Migration[6.0]
  def change
    change_column :user_ingredients, :amount, :float
  end
end
