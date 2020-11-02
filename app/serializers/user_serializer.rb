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
  attributes :id, :name, :username, :location, :email_address, :profile_pic, :recipes, :friends
end
