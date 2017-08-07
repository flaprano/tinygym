class DailyToken < ApplicationRecord
  belongs_to :user
  has_one :gym

  has_secure_token
end
