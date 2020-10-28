class ChangeDirectionsToJson < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :directions_json, :json
  end
end
