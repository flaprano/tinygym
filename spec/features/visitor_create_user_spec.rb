require 'rails_helper'

feature 'Visitor create user' do
  scenario 'successfully' do
    visit root_path
    click_on 'Create User'
    fill_in 'Email', with: 'teste@teste.com'
    fill_in 'Name', with: 'João da Silva'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    check('Gym Manager?')
    fill_in 'user_addresses_attributes_0_address_type', with: 'Home'
    fill_in 'user_addresses_attributes_0_latitude', with: '-23.3139522'
    fill_in 'user_addresses_attributes_0_longitude', with: '-46.7490466'
    click_on 'Sign up'

    expect(current_path).to eq(root_path)
  end

  scenario 'and password < 6' do
    visit root_path
    click_on 'Create User'
    fill_in 'Email', with: 'teste@gmail.com'
    fill_in 'Name', with: 'João da Silva'
    fill_in 'Password', with: '12345'
    fill_in 'Password confirmation', with: '12345'
    check('Gym Manager?')
    fill_in 'user_addresses_attributes_0_address_type', with: 'Home'
    fill_in 'user_addresses_attributes_0_latitude', with: '-23.3139522'
    fill_in 'user_addresses_attributes_0_longitude', with: '-46.7490466'
    click_on 'Sign up'

    expect(page).to have_css('li', text: 'Password is too short (minimum is 6 characters)')
  end

  scenario 'and password confirmation dont match' do
    visit root_path
    click_on 'Create User'
    fill_in 'Email', with: 'teste@gmail.com'
    fill_in 'Name', with: 'João da Silva'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123455'
    check('Gym Manager?')
    fill_in 'user_addresses_attributes_0_address_type', with: 'Home'
    fill_in 'user_addresses_attributes_0_latitude', with: '-23.3139522'
    fill_in 'user_addresses_attributes_0_longitude', with: '-46.7490466'
    click_on 'Sign up'

    expect(page).to have_css('li', text: 'Password confirmation doesn\'t match Password')
  end

  scenario 'and email has already been taken' do
    address = create(:user_address)
    user = address.model
    user.gym_manager = true

    visit root_path
    click_on 'Create User'
    fill_in 'Email', with: user.email
    fill_in 'Name', with: 'João da Silva'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    check('Gym Manager?')
    fill_in 'user_addresses_attributes_0_address_type', with: 'Home'
    fill_in 'user_addresses_attributes_0_latitude', with: '-23.3139522'
    fill_in 'user_addresses_attributes_0_longitude', with: '-46.7490466'
    click_on 'Sign up'

    expect(page).to have_css('li', text: 'Email has already been taken')
  end

  scenario 'and define gym manager' do
    visit root_path
    click_on 'Create User'
    fill_in 'Email', with: 'teste@gmail.com'
    fill_in 'Name', with: 'João da Silva'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    check('Gym Manager?')
    fill_in 'user_addresses_attributes_0_address_type', with: 'Home'
    fill_in 'user_addresses_attributes_0_latitude', with: '-23.3139522'
    fill_in 'user_addresses_attributes_0_longitude', with: '-46.7490466'
    click_on 'Sign up'

    expect(current_path).to eq(root_path)
  end
end
