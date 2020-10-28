# == Schema Information
#
# Table name: trips
#
#  id         :bigint           not null, primary key
#  name       :string
#  location   :string
#  start_date :date
#  end_date   :date
#  cost       :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class TripSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :start_date, :end_date, :cost
end
