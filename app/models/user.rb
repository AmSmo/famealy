# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  name            :string
#  username        :string
#  location        :string
#  password_digest :string
#  email_address   :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    has_secure_password
    has_many :user_users, dependent: :destroy
    has_many :friends, through: :user_users
    has_many :user_recipes, dependent: :destroy
    has_many :recipes, through: :user_recipes
    has_many :user_ingredients, dependent: :destroy
    has_many :ingredients, through: :user_ingredients
    has_many :supplied_ingredients, through: :user_ingredients
    has_many :user_potlucks, dependent: :destroy
    has_many :potlucks, through: :user_potlucks
    
    validates :username, uniqueness: { case_sensitive: false }
    validates :email_address, uniqueness: { case_sensitive: false }

end
