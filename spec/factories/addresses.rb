FactoryGirl.define do
  factory :user_address, class: "Address" do
    association :model, :factory => :user
    address_type "Work"
    latitude -23.552083
    longitude -46.681927
  end

  factory :gym_address, class: "Address" do
    association :model, :factory => :gym
    address_type "Work"
    latitude -23.552083
    longitude -46.681927
  end
end
