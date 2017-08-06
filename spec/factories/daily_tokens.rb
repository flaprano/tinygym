FactoryGirl.define do
  factory :daily_token do
    user nil
    gym nil
    token "MyString"
    used false
    date_used "2017-08-06"
  end
end
