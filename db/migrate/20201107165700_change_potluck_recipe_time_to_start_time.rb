class ChangePotluckRecipeTimeToStartTime < ActiveRecord::Migration[6.0]
  def change
    rename_column :potluck_recipes, :time, :start_time
  end
end
