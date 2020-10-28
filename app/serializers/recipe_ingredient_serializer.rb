class RecipeIngredientSerializer < ActiveModel::Serializer
  attributes :amount, :amount_type, :description, :ingredient
  
  def ingredient
    ActiveModelSerializers::SerializableResource.new(self.object.ingredient)
  end
end
