class PotluckCardSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :date, :photo
  has_many :users
  include Rails.application.routes.url_helpers
  
  
  def photo
    if self.object&.photo&.attached?
      return "http://localhost:3001#{rails_blob_url(self.object.photo, only_path: true)}"
    else
      return "http://clipart-library.com/img1/925908.png"
    end
  end

end
