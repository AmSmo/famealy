class Potluck < ApplicationRecord
    has_many :user_potlucks
    has_many :users, through: :user_potlucks
    has_many :recipes_potluck
    has_many :recipes, through: :recipes_potluck
    has_many :potluck_trips
    has_one :trip, through: :potluck_trip
end
