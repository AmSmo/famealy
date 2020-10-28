# == Schema Information
#
# Table name: recipe_ingredients
#
#  id            :bigint           not null, primary key
#  recipe_id     :bigint           not null
#  ingredient_id :bigint           not null
#  amount        :integer
#  amount_type   :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient
end
