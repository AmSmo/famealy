class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :spoon_id, :description, :time, :price, :directions
end
