# == Schema Information
#
# Table name: potlucks
#
#  id         :bigint           not null, primary key
#  name       :string
#  location   :string
#  date       :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class PotluckSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  

  attributes :id, :name, :location, :date, :ingredients, :photo
  has_many :potluck_recipes
  has_many :users
  has_many :supplied_ingredients
  def recipes
    self.object.recipes
  end
  
  def photo
    if self.object&.photo&.attached?
      return "http://localhost:3001#{rails_blob_url(self.object.photo, only_path: true)}"
    else
      return "http://clipart-library.com/img1/925908.png"
    end
  end
  
end
