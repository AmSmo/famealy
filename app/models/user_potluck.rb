class UserPotluck < ApplicationRecord
  belongs_to :user
  belongs_to :potluck
end
