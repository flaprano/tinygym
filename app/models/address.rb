class Address < ApplicationRecord
  belongs_to :model, polymorphic: true, optional: true
end
