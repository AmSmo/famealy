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
class Trip < ApplicationRecord
    has_many :trip_potlucks, dependent: :destroy
    has_many :potlucks, through: :trip_potlucks
end
