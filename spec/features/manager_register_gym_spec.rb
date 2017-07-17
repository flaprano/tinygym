require 'rails_helper'

feature 'Manager register gym' do
  scenario 'successfully' do
    #Dados

    #Navegação
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
    
    click_on 'Register Gym'
    
    fill_in 'Name', with: 'Academia WellFit'
    fill_in 'gym_address_attributes_address_type', with: 'Home'
    fill_in 'gym_address_attributes_latitude', with: '-23.3139522'
    fill_in 'gym_address_attributes_longitude', with: '-46.7490466'
    fill_in 'Opening time', with: Time.local(2000,"jan",1,9,0,0)
    fill_in 'Closing time', with: Time.local(2000,"jan",1,23,0,0)
    
    click_on 'Register'
    
    #Expectativa
    expect(page).to have_css('h1', text: 'Academia WellFit')
  end
end
