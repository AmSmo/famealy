class ChangeUserIngredientsTableImageUnits < ActiveRecord::Migration[6.0]
  def change
    add_column :ingredients, :possible_units, :text, array: true, default: []
    add_column :ingredients, :image_url, :string
  end
end
