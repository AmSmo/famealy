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
    has_many :trip_potlucks, dependent: :destroy
    has_one :trip, through: :trip_potlucks
end
