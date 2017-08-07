require 'rails_helper'

feature 'User use daily token' do
  scenario 'successfully' do
    user_address = create(:user_address)
    user = user_address.model
    daily_token = create(:daily_token, user: user)
    gym_address = create(:gym_address)
    gym = gym_address.model

    login_as(user)
    visit root_path
    click_on 'Gyms'
    click_on gym.name
    fill_in 'Token', with: daily_token.token
    click_on 'Use Daily Token'

    expect(page).to have_content('Daily token used')
  end

  scenario 'and already used' do
    user_address = create(:user_address)
    user = user_address.model
    daily_token = create(:daily_token, user: user, used: true, date_used: Time.zone.today)
    gym_address = create(:gym_address)
    gym = gym_address.model

    login_as(user)
    visit root_path
    click_on 'Gyms'
    click_on gym.name
    fill_in 'Token', with: daily_token.token
    click_on 'Use Daily Token'

    expect(page).to have_content('Daily token already used')
  end

  scenario 'and date diferent from today' do
    user_address = create(:user_address)
    user = user_address.model
    daily_token = create(:daily_token, user: user, created_at: Time.zone.today - 2)
    gym_address = create(:gym_address)
    gym = gym_address.model

    login_as(user)
    visit root_path
    click_on 'Gyms'
    click_on gym.name
    fill_in 'Token', with: daily_token.token
    click_on 'Use Daily Token'

    expect(page).to have_content('Daily token expired')
  end

  scenario 'and token dont exist' do
    user_address = create(:user_address)
    user = user_address.model
    gym_address = create(:gym_address)
    gym = gym_address.model

    login_as(user)
    visit root_path
    click_on 'Gyms'
    click_on gym.name
    fill_in 'Token', with: 'hahsyehs8727287nw276893'
    click_on 'Use Daily Token'

    expect(page).to have_content('Daily token dont exist')
  end

  scenario 'and daily token belongs to another user' do
    user_address = create(:user_address)
    user = user_address.model
    another_user_address = create(:user_address)
    another_user = another_user_address.model
    daily_token = create(:daily_token, user: another_user, created_at: Time.zone.today)
    gym_address = create(:gym_address)
    gym = gym_address.model

    login_as(user)
    visit root_path
    click_on 'Gyms'
    click_on gym.name
    fill_in 'Token', with: daily_token.token
    click_on 'Use Daily Token'

    expect(page).to have_content('Invalid daily token')
  end
end
