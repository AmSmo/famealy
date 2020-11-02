class PotluckRecipeSerializer < ActiveModel::Serializer
  attributes :user, :recipe
  def user
    ActiveModelSerializers::SerializableResource.new(self.object.user)
  end
  def recipe
    ActiveModelSerializers::SerializableResource.new(self.object.recipe)
  end
  
end
