FactoryGirl.define do
  factory :daily_token do
    user
    token ''
    used false
    date_used Time.zone.today
  end
end
