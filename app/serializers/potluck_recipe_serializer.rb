class PotluckRecipeSerializer < ActiveModel::Serializer
  attributes :user, :recipe, :start_time, :potluck_recipe_id

  def potluck_recipe_id
    self.object.id
  end 
  def user
    ActiveModelSerializers::SerializableResource.new(self.object.user)
  end
  def recipe
    ActiveModelSerializers::SerializableResource.new(self.object.recipe)
  end
  
end
