# == Schema Information
#
# Table name: user_potlucks
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  potluck_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class UserPotluck < ApplicationRecord
  belongs_to :user
  belongs_to :potluck
end
