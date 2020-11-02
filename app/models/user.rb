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
    include Rails.application.routes.url_helpers
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
    has_one_attached :profile_pic
    def pic
        user = User.find_by(id: User.first.id)
        if user&.profile_pic&.attached?
            return "http://localhost:3000#{rails_blob_url(self.profile_pic, only_path: true)}"
        else
            return false
        end
    end
end
