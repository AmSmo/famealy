# == Schema Information
#
# Table name: user_users
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  friend     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class UserUser < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User", foreign_key: "friend"
end
