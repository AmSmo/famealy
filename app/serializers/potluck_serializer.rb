class PotluckSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :date
end
