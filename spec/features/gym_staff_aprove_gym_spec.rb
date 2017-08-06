require 'rails_helper'

feature 'gym_staff_aprove_gym' do
  scenario 'successfully' do
    user_address = create(:user_address)
    user = user_address.model
    user.email = 'user1@gympass.com'
    gym_address = create(:gym_address)
    gym = gym_address.model

    login_as(user)
    visit root_path
    click_on 'Gyms'
    click_on gym.name

    expect(GymMailer).to receive(:notify_gym_approved).with(gym).and_call_original

    click_on 'Approve Gym'
  end
end
