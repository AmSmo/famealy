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
  attributes :id, :name, :location, :date
end
