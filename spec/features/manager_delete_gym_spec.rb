require 'rails_helper'

feature 'Gym manager delete gym' do
  scenario 'successfully' do
    user_address = create(:user_address)
    user = user_address.model
    user.gym_manager = true
    gym_address = create(:gym_address)
    gym = gym_address.model
    gym.user = user
    gym.save

    login_as(user)
    visit root_path
    click_on 'My Gyms'
    click_on gym.name
    click_on 'Delete'

    expect(page).to have_content('Gym deleted')
  end
end
