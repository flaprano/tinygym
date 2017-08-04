class Address < ApplicationRecord
  belongs_to :model, polymorphic: true, optional: true

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
end
