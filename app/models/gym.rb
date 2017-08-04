class Gym < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
  has_one :address, as: :model
  accepts_nested_attributes_for :address
end
