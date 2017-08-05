FactoryGirl.define do
  factory :user do
    email
    name 'Felipe Laprano'
    password '123456'
    gym_manager false
  end

  sequence :email do |n|
    "usuario#{n}@example.com"
  end
end
