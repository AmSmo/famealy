# == Schema Information
#
# Table name: ingredients
#
#  id         :bigint           not null, primary key
#  name       :string
#  spoon_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Ingredient < ApplicationRecord
    has_many :recipe_ingredients, dependent: :destroy
    has_many :recipes, through: :recipe_ingredients
    has_many :supplied_ingredients, dependent: :destroy
    has_many :potlucks, through: :supplied_ingredients
    has_many :user_ingredients, dependent: :destroy
    has_many :users, through: :user_ingredients
end
