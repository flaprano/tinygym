require 'rails_helper'

RSpec.describe GymMailer, type: :mailer do
  describe '#notify_gym_approved' do
    it 'create the mail correctly' do
      user_address = create(:user_address)
      user = user_address.model
      user.email = 'user1@gympass.com'
      gym_address = create(:gym_address)
      gym = gym_address.model
      gym.approved = true

      mail = GymMailer.notify_gym_approved(gym)

      expect(mail.to).to include gym.user.email
      expect(mail.subject).to eq 'Your Gym was approved!'
      expect(mail.body).to include 'Congrats! Your gym was approved'
      expect(mail.body).to include 'the gym you have register was approved.'
    end
  end
end
