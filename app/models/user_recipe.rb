# == Schema Information
#
# Table name: user_recipes
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  recipe_id  :bigint           not null
#  rating     :integer
#  review     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class UserRecipe < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
end
