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
  attributes :id, :name, :spoon_id, :description, :time, :price, :directions
end
