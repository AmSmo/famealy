# == Schema Information
#
# Table name: potlucks
#
#  id         :bigint           not null, primary key
#  name       :string
#  location   :string
#  date       :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Potluck < ApplicationRecord
    has_many :user_potlucks, dependent: :destroy
    has_many :users, through: :user_potlucks
    has_many :potluck_recipes, dependent: :destroy
    has_many :recipes, through: :potluck_recipes
    has_many :recipe_ingredients, through: :recipes
    has_many :trip_potlucks, dependent: :destroy
    has_many :supplied_ingredients, dependent: :destroy
    has_one :trip, through: :trip_potlucks

    def ingredients
        ings = self.recipe_ingredients.map do |recipe_ingredient|
            hashed_ri = recipe_ingredient.serializable_hash
            hashed_ri.delete("created_at")
            hashed_ri.delete("updated_at")
            hashed_ri.delete("updated_at")
            hashed_ri[:possible_units] = recipe_ingredient.ingredient.possible_units
            hashed_ri[:ingredient_name] = recipe_ingredient.ingredient.name
            hashed_ri[:ingredient_id] = recipe_ingredient.ingredient.spoon_id
            hashed_ri
        end
        ings
    end
end
