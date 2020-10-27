class Potluck < ApplicationRecord
    has_many :user_potlucks, dependent: :destroy
    has_many :users, through: :user_potlucks
    has_many :potluck_recipes, dependent: :destroy
    has_many :recipes, through: :potluck_recipes
    has_many :trip_potlucks, dependent: :destroy
    has_one :trip, through: :trip_potlucks
end
