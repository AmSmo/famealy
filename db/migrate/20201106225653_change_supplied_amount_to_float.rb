class ChangeSuppliedAmountToFloat < ActiveRecord::Migration[6.0]
  def change
    change_column :supplied_ingredients, :amount, :float
  end
end
