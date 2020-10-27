class SuppliedIngredient < ApplicationRecord
  belongs_to :ingredient
  belongs_to :potluck
  has_one :supplier, class_name: "UserIngredient", primary_key: :user_ingredient,  foreign_key: :id
end
