require 'rails_helper'

feature 'admin can create new brewery' do
  let(:admin) { FactoryGirl.create(:user, role: "admin") }
  let(:user) { FactoryGirl.create(:user) }
  
  scenario 'admin creates brewery' do
    login_as admin
    visit new_admin_brewery_path
    
    brewery = FactoryGirl.build(:brewery)

    fill_in 'Name', with: brewery.name
    fill_in 'Address', with: brewery.address
    fill_in 'City', with: brewery.city
    fill_in 'State', with: brewery.state
    fill_in 'Zip', with: brewery.zip
    fill_in 'Phone Number', with: brewery.phone_number
    fill_in 'URL', with: brewery.url
    fill_in 'Description', with: brewery.description
    fill_in 'Hours', with: brewery.hours

    click_button "Create"
    expect(page).to have_content("Brewery successfully added")
  end

  scenario 'user tries to create brewery' do
    login_as user
    visit new_admin_brewery_path
    expect(page).to have_content("The page you were looking for doesn't exist")
  end
end
