# == Schema Information
#
# Table name: recipes
#
#  id          :bigint           not null, primary key
#  name        :string
#  spoon_id    :integer
#  description :string
#  time        :integer
#  price       :float
#  directions  :string
#  cost        :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Recipe < ApplicationRecord
    has_many :user_recipes, dependent: :destroy
    has_many :users, through: :user_recipes
    has_many :recipe_ingredients, dependent: :destroy
    has_many :ingredients, through: :recipe_ingredients
    has_many :potluck_recipes, dependent: :destroy
    has_many :potlucks, through: :potluck_recipes

    def self.translate_amount(amount)
            case amount.downcase()
            when "tsps"
                return "tsp"
            when "tbsps"
                return "tbsp"
            when "cloves"
                return "clove"
            when "cups"
                return "cup"
            else
                return amount
            end
        end
    
end
