class Trip < ApplicationRecord
    has_many :trip_potlucks, dependent: :destroy
    has_many :potlucks, through: :trip_potlucks
end
