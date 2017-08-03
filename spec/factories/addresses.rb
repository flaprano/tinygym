FactoryGirl.define do
  factory :address do
    user
    address_type "MyString"
    latitude "1234567678"
    longitude "1234345545"
  end
end
