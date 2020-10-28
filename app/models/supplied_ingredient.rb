# == Schema Information
#
# Table name: supplied_ingredients
#
#  id              :bigint           not null, primary key
#  ingredient_id   :bigint           not null
#  potluck_id      :bigint           not null
#  quantity        :integer
#  user_ingredient :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class SuppliedIngredient < ApplicationRecord
  belongs_to :ingredient
  belongs_to :potluck
  has_one :supplier, class_name: "UserIngredient", primary_key: :user_ingredient,  foreign_key: :id
end
