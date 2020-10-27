class PotluckRecipe < ApplicationRecord
  belongs_to :recipe
  belongs_to :potluck
end
