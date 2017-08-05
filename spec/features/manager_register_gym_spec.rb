require 'rails_helper'

feature 'Gym manager register gym' do
  scenario 'successfully' do
    address = create(:user_address)
    user = address.model
    user.gym_manager = true

    login_as(user)
    visit root_path
    click_on 'Register Gym'
    fill_in 'Name', with: 'Academia WellFit'
    fill_in 'gym_address_attributes_address_type', with: 'Home'
    fill_in 'gym_address_attributes_latitude', with: '-23.3139522'
    fill_in 'gym_address_attributes_longitude', with: '-46.7490466'
    fill_in 'Opening time', with: Time.zone.local(2000, 'jan', 1, 9, 0, 0)
    fill_in 'Closing time', with: Time.zone.local(2000, 'jan', 1, 23, 0, 0)
    click_on 'Register'

    expect(page).to have_css('h1', text: 'Academia WellFit')
  end
end
