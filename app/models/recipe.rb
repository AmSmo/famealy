class Recipe < ApplicationRecord
    has_many :user_recipes, dependent: :destroy
    has_many :users, through: :user_recipes
    has_many :recipe_ingredients, dependent: :destroy
    has_many :ingredients, through: :recipe_ingredients
    has_many :potluck_recipes, dependent: :destroy
    has_many :potlucks, through: :potluck_recipes
end
