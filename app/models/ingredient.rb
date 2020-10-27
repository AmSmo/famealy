class Ingredient < ApplicationRecord
    has_many :recipe_ingredients, dependent: :destroy
    has_many :recipes, through: :recipe_ingredients
    has_many :supplied_ingredients, dependent: :destroy
    has_many :potlucks, through: :supplied_ingredients
    has_many :user_ingredients, dependent: :destroy
    has_many :users, through: :user_ingredients
end
