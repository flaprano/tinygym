FactoryGirl.define do
  factory :address do
    address_type "Work"
    latitude "1234567678"
    longitude "1234345545"
    user
  end
end
