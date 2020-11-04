class SuppliedIngredientSerializer < ActiveModel::Serializer
  attributes :id, :potluck_id, :amount, :amount_type, :user_id, :ingredient_name, :ingredient_id

  def ingredient_id
    self.object.ingredient.spoon_id
  end

  def ingredient_name
    self.object.ingredient.name
  end
end
