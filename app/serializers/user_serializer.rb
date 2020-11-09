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
class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :username, :location, :email_address, :recipes, :friends, :potlucks, :ingredients, :profile

  def profile
    if self.object&.profile&.attached?
      return "http://localhost:3001#{rails_blob_url(self.object.profile, only_path: true)}"
    else
      return "http://clipart-library.com/img1/925908.png"
    end
  end


  def ingredients
    ActiveModelSerializers::SerializableResource.new(self.object.user_ingredients)
  end
end
