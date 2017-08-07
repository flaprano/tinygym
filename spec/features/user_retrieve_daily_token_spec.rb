require 'rails_helper'

feature 'User retrieve daily token' do
  scenario 'successfully' do
    address = create(:user_address)
    user = address.model

    login_as(user)
    visit root_path
    click_on 'Retrieve Daily Token'

    expect(page).to have_content("Token gerado com sucesso")
  end
end
