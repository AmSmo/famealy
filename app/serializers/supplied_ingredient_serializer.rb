class SuppliedIngredientSerializer < ActiveModel::Serializer
  attributes :id, :potluck_id, :amount, :amount_type, :user_id, :ingredient_name, :ingredient_id, :image_url, :potluck_name, :possible_units

  def ingredient_id
    self.object.ingredient.spoon_id
  end

  def potluck_name
    self.object.potluck.name
  end
  def possible_units
    self.object.ingredient.possible_units
  end

  def ingredient_name
    self.object.ingredient.name
  end
  
  def image_url
    self.object.ingredient.image_url
  end
end
