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
      return "https://i.etsystatic.com/17857814/r/il/5439b3/1564754370/il_1588xN.1564754370_i805.jpg"
    end
  end


  def ingredients
    ActiveModelSerializers::SerializableResource.new(self.object.user_ingredients)
  end
end
