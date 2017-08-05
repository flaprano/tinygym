FactoryGirl.define do
  factory :gym do
    name
    opening_time '2017-07-16 09:00:00'
    closing_time '2017-07-16 23:00:00'
    user
  end

  sequence :name do |n|
    "Academia#{n}"
  end
end
