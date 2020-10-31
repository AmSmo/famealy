class UserIngredientSerializer < ActiveModel::Serializer
  attributes :id, :amount, :amount_type
  has_one :ingredient
end
