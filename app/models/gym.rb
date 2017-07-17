class Gym < ApplicationRecord
  belongs_to :user
  has_one :address, as: :model
end
