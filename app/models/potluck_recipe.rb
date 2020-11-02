# == Schema Information
#
# Table name: potluck_recipes
#
#  id         :bigint           not null, primary key
#  recipe_id  :bigint           not null
#  potluck_id :bigint           not null
#  time       :time
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class PotluckRecipe < ApplicationRecord
  belongs_to :recipe
  belongs_to :potluck
  belongs_to :user
end
