require 'rails_helper'

feature 'Visitor create regular user' do
  scenario 'successfully' do
    #Dados

    #Naveggação
    visit root_path
    click_on 'Create User'

    fill_in 'Email', with: 'teste@gmail.com'
    fill_in 'Name', with: 'João da Silva'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'

    click_on 'Sign up'

    #Expectativa
    expect(current_path).to eq(root_path)
    expect(page).to have_css('p', text: 'Welcome! You have signed up successfully.')
  end

  scenario 'and password < 6' do
    #Dados

    #Naveggação
    visit root_path
    click_on 'Create User'

    fill_in 'Email', with: 'teste@gmail.com'
    fill_in 'Name', with: 'João da Silva'
    fill_in 'Password', with: '12345'
    fill_in 'Password confirmation', with: '12345'

    click_on 'Sign up'

    #Expectativa
    expect(page).to have_css('li', text: 'Password is too short (minimum is 6 characters)')
  end

  scenario 'and password confirmation dont match' do
    #Dados

    #Naveggação
    visit root_path
    click_on 'Create User'

    fill_in 'Email', with: 'teste@gmail.com'
    fill_in 'Name', with: 'João da Silva'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123455'

    click_on 'Sign up'

    #Expectativa
    expect(page).to have_css('li', text: 'Password confirmation doesn\'t match Password')
  end

  scenario 'and email has already been taken' do
    #Dados

    #Naveggação
    visit root_path
    click_on 'Create User'

    fill_in 'Email', with: 'teste@gmail.com'
    fill_in 'Name', with: 'João da Silva'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'

    click_on 'Sign up'

    sign_out :user

    click_on 'Create User'

    fill_in 'Email', with: 'teste@gmail.com'
    fill_in 'Name', with: 'João da Silva'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'

    click_on 'Sign up'

    #Expectativa
    expect(page).to have_css('li', text: 'Email has already been taken')
  end

  scenario 'and define gym manager' do
    visit root_path
    click_on 'Create User'

    fill_in 'Email', with: 'teste@gmail.com'
    fill_in 'Name', with: 'João da Silva'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    check('Gym manager')

    click_on 'Sign up'

    #Expectativa
    expect(current_path).to eq(root_path)
    expect(page).to have_css('p', text: 'Welcome! You have signed up successfully.')
  end
end
