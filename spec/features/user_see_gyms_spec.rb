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
    expect(page).to have_css('li', text: gym1.opening_time.strftime('%H:%M'))
    expect(page).to have_css('li', text: gym1.closing_time.strftime('%H:%M'))
    expect(page).to have_css('li', text: gym2.name)
    expect(page).to have_css('li', text: gym2.address.latitude)
    expect(page).to have_css('li', text: gym2.address.longitude)
    expect(page).to have_css('li', text: gym2.opening_time.strftime('%H:%M'))
    expect(page).to have_css('li', text: gym2.closing_time.strftime('%H:%M'))
  end

  scenario 'and have no gym around' do
    user_address = create(:user_address, latitude: -40.741895, longitude: -73.989308)
    user = user_address.model
    user.gym_manager = true
    create(:gym_address)
    create(:gym_address, latitude: -23.543586, longitude: -46.736859)

    login_as(user)
    visit root_path
    click_on 'Gyms'

    expect(page).to have_css('p', text: 'There is no gym around you')
  end

  scenario 'and change the address point to one of his address' do
    user_address = create(:user_address, latitude: -23.543586, longitude: -46.606869)
    user = user_address.model
    user.gym_manager = true
    gym1_address = create(:gym_address, latitude: -23.543586, longitude: -46.736859)
    gym1 = gym1_address.model
    gym2_address = create(:gym_address, latitude: -40.741895, longitude: -73.989308)
    gym2 = gym2_address.model

    login_as(user)
    visit root_path
    click_on 'Gyms'
    select 'Work', from: 'My Addresses'
    click_on 'Filter by address'

    expect(page).to have_css('li', text: gym1.name)
    expect(page).to have_css('li', text: gym1.address.latitude)
    expect(page).to have_css('li', text: gym1.address.longitude)
    expect(page).not_to have_css('li', text: gym2.name)
    expect(page).not_to have_css('li', text: gym2.address.latitude)
    expect(page).not_to have_css('li', text: gym2.address.longitude)
  end

  scenario 'and change the address point to one of his address and has no gyms' do
    user_address = create(:user_address, latitude: -24.543586, longitude: -47.606869)
    user = user_address.model
    user.gym_manager = true
    create(:gym_address, latitude: -23.543586, longitude: -46.736859)
    create(:gym_address, latitude: -40.741895, longitude: -73.989308)

    login_as(user)
    visit root_path
    click_on 'Gyms'
    select 'Work', from: 'My Addresses'
    click_on 'Filter by address'

    expect(page).to have_css('p', text: 'There is no gym around you')
  end

  scenario 'and change the address point to latitude/longitude location' do
    user_address = create(:user_address)
    user = user_address.model
    user.gym_manager = true
    gym1_address = create(:gym_address, latitude: -23.543586, longitude: -46.736859)
    gym1 = gym1_address.model
    gym2_address = create(:gym_address, latitude: -40.741895, longitude: -73.989308)
    gym2 = gym2_address.model

    login_as(user)
    visit root_path
    click_on 'Gyms'
    fill_in 'Location by Latitude,Longitude', with: '-23.543586,-46.606869'
    click_on 'Filter by location'

    expect(page).to have_css('li', text: gym1.name)
    expect(page).to have_css('li', text: gym1.address.latitude)
    expect(page).to have_css('li', text: gym1.address.longitude)
    expect(page).not_to have_css('li', text: gym2.name)
    expect(page).not_to have_css('li', text: gym2.address.latitude)
    expect(page).not_to have_css('li', text: gym2.address.longitude)
  end

  scenario 'and change the address point to latitude/longitude location and has no gyms' do
    user_address = create(:user_address)
    user = user_address.model
    user.gym_manager = true
    create(:gym_address, latitude: -23.543586, longitude: -46.736859)
    create(:gym_address, latitude: -40.741895, longitude: -73.989308)

    login_as(user)
    visit root_path
    click_on 'Gyms'
    fill_in 'Location by Latitude,Longitude', with: '-24.543586,-47.606869'
    click_on 'Filter by location'

    expect(page).to have_css('p', text: 'There is no gym around you')
  end
end
