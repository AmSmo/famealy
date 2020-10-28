# == Schema Information
#
# Table name: ingredients
#
#  id         :bigint           not null, primary key
#  name       :string
#  spoon_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class IngredientSerializer < ActiveModel::Serializer
  attributes :name, :spoon_id
end
