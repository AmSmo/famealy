# == Schema Information
#
# Table name: recipes
#
#  id          :bigint           not null, primary key
#  name        :string
#  spoon_id    :integer
#  description :string
#  time        :integer
#  price       :float
#  directions  :string
#  cost        :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :spoon_id, :description, :time, :cost, :image_url, :directions, :directions_json, :reviews, :ratings
  has_many :recipe_ingredients
  def ratings
    self.object.user_recipes.map do |user_recipe|
      {user_name: user_recipe.user.username, user_id: user_recipe.user.id, rating: user_recipe.rating}
    end
  end
  def reviews
    self.object.user_recipes.map do |user_recipe|
      {user_name: user_recipe.user.username, user_id: user_recipe.user.id, review: user_recipe.review}
    end
  end
end
