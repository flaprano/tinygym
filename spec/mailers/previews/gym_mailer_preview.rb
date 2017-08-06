# Preview all emails at http://localhost:3000/rails/mailers/gym_mailer
class GymMailerPreview < ActionMailer::Preview
  def notify_new_proposal
    user_address = create(:user_address)
    user = user_address.model
    user.email = 'user1@gympass.com'
    gym_address = create(:gym_address)
    gym = gym_address.model
    gym.approved = true

    GymMailer.notify_gym_approved(gym)
  end
end
