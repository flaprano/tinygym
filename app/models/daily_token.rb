class DailyToken < ApplicationRecord
  belongs_to :user
  has_one :gym

  has_secure_token

  def self.get_daily_token(user)
    today_beginning = Time.zone.today.beginning_of_day
    today_end = Time.zone.today.end_of_day
    daily_token = DailyToken.find_by(user: user, created_at: today_beginning..today_end)
    daily_token = DailyToken.new if daily_token.nil?
    daily_token
  end
end
