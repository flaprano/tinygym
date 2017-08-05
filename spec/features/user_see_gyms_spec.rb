require 'rails_helper'

feature 'User see list of gyms' do
  scenario 'successfully' do
    user_address = create(:user_address)
    user = user_address.model
    user.gym_manager = true
    gym1_address = create(:gym_address)
    gym1 = gym1_address.model
    gym2_address = create(:gym_address, latitude: -23.543586, longitude: -46.736859)
    gym2 = gym2_address.model

    login_as(user)
    visit root_path
    click_on 'Gyms'

    expect(page).to have_css('li', text: gym1.name)
    expect(page).to have_css('li', text: gym1.address.latitude)
    expect(page).to have_css('li', text: gym1.address.longitude)
    expect(page).to have_css('li', text: gym2.name)
    expect(page).to have_css('li', text: gym2.address.latitude)
    expect(page).to have_css('li', text: gym2.address.longitude)
  end

  scenario 'and ' do
  end
end
