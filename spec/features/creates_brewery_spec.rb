require 'rails_helper'

feature 'creates brewery', %q(
  As an admin or a brewer, I want to be able to create a new brewery,
  so that it can be reviewed by our site's users.
  # I can fill in a form to create a new brewery
  # I will be redirected to the brewery's page
  # I cannot fill in the form incompletely
  # I cannot add a brewery that has already been created
) do

  scenario 'inserts valid input' do
    brewery = FactoryGirl.build(:brewery)

    visit new_brewery_path

    fill_in 'Name', with: brewery.name
    fill_in 'Address', with: brewery.address
    fill_in 'City', with: brewery.city
    fill_in 'State', with: brewery.state
    fill_in 'Zip', with: brewery.zip
    fill_in 'Phone Number', with: brewery.phone_number
    fill_in 'URL', with: brewery.url
    fill_in 'Description', with: brewery.description
    fill_in 'Hours', with: brewery.hours
    click_button 'Create'

    expect(page).to have_content brewery.name
    expect(page).to have_content 'Brewery successfully added'

  end

  scenario 'inserts invalid input' do
    visit new_brewery_path

    click_button 'Create'

    expect(page).to_not have_content 'Brewery successfully added'
    expect(page).to have_content "can't be blank"
  end

  scenario 'inserts repeated input' do
    brewery = FactoryGirl.create(:brewery)

    visit new_brewery_path

    fill_in 'Name', with: brewery.name
    fill_in 'Address', with: brewery.address
    fill_in 'City', with: brewery.city
    fill_in 'State', with: brewery.state
    fill_in 'Zip', with: brewery.zip
    fill_in 'Phone Number', with: brewery.phone_number
    fill_in 'URL', with: brewery.url
    fill_in 'Description', with: brewery.description
    fill_in 'Hours', with: brewery.hours
    click_button 'Create'

    expect(page).to_not have_content 'Brewery successfully added'
    expect(page).to have_content "has already been taken"
  end
end
