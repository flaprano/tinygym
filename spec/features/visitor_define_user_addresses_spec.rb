require 'rails_helper'

feature 'User define user addresses' do
  scenario 'successfully' do
    #Dados

    #Naveggação
    visit root_path
    click_on 'Create User'

    fill_in 'Email', with: 'teste@gmail.com'
    fill_in 'Name', with: 'João da Silva'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'

    fill_in 'user_addresses_attributes_0_address_type', with: 'Home'
    fill_in 'user_addresses_attributes_0_latitude', with: '-23.3139522'
    fill_in 'user_addresses_attributes_0_longitude', with: '-46.7490466'

    fill_in 'user_addresses_attributes_1_address_type', with: 'Work'
    fill_in 'user_addresses_attributes_1_latitude', with: '-23.3139522'
    fill_in 'user_addresses_attributes_1_longitude', with: '-46.7490466'
    
    click_on 'Sign up'

    #Expectativa
    expect(current_path).to eq(root_path)
    expect(page).to have_css('p', text: 'Welcome! You have signed up successfully.')
  end
end
