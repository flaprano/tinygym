require 'rails_helper'

feature 'User edit data' do
  scenario 'successfully' do
    address = create(:user_address)
    user = address.model
    user.gym_manager = true

    login_as(user)
    visit root_path
    click_on 'Edit User'
    fill_in 'Name', with: 'Zezinho'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    fill_in 'Current password', with: '123456'
    click_on 'Update'

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Your account has been updated successfully.')
  end
end
