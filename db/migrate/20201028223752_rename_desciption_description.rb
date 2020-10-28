class RenameDesciptionDescription < ActiveRecord::Migration[6.0]
  def change
    rename_column :recipe_ingredients, :desciption, :description
  end
end
