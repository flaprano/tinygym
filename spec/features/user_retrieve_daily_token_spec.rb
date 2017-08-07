require 'rails_helper'

feature 'User retrieve daily token' do
  scenario 'successfully' do
    address = create(:user_address)
    user = address.model

    login_as(user)
    visit root_path
    click_on 'Retrieve Daily Token'

    expect(page).to have_content('Token generated with success')
  end

  scenario 'and daily token is already retrivied' do
    address = create(:user_address)
    user = address.model
    create(:daily_token, user: user)

    login_as(user)
    visit root_path
    click_on 'Retrieve Daily Token'

    expect(page).to have_content('Daily token already retrivied')
  end
end
