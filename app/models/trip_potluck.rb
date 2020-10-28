# == Schema Information
#
# Table name: trip_potlucks
#
#  id         :bigint           not null, primary key
#  potluck_id :bigint           not null
#  trip_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class TripPotluck < ApplicationRecord
  belongs_to :potluck
  belongs_to :trip
end
