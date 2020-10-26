class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :location, :password_digest, :email_address
end
