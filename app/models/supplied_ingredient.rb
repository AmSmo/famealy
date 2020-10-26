class SuppliedIngredient < ApplicationRecord
  belongs_to :ingredient
  belongs_to :potluck
end
