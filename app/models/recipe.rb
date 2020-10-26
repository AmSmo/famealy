class Recipe < ApplicationRecord
    has_many :user_recipes
    has_many :users, through: :user_recipes
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
    has_many :recipes_potluck
    has_many :potlucks, through: :recipes_potluck
end
