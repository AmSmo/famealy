# == Schema Information
#
# Table name: user_ingredients
#
#  id            :bigint           not null, primary key
#  user_id       :bigint           not null
#  ingredient_id :bigint           not null
#  amount        :integer
#  amount_type   :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class UserIngredient < ApplicationRecord
  belongs_to :user
  belongs_to :ingredient
end
