# == Schema Information
#
# Table name: potlucks
#
#  id         :bigint           not null, primary key
#  name       :string
#  location   :string
#  date       :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class PotluckSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :date, :ingredients, :supplied_ingredients
  has_many :potluck_recipes
  has_many :users

  def recipes
    self.object.recipes
  end
 
  # def ingredients
  #   self.object.recipe_ingredients.map do |recipe_ingredient|

  #     recipe_ingredient[name] = recipe_ingredient.ingredient.name
  #     recipe_ingredient[ingredient_id] = recipe_ingredient.ingredient.spoon_id
  #   end

  # end
end
