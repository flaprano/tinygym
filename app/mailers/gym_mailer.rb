class GymMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def notify_gym_approved(gym)
    @url = 'http://example.com/login'
    @gym = gym
    @user = gym.user

    mail to: @user.email, subject: 'Your Gym was approved!'
  end
end
