require 'rails_helper'

feature 'update brewery information', %Q{
   As an admin
   I want to be able to update information about a brewery
   So that users can view current information
  } do

  # Acceptance Criteria:
  # * I can navigate to a page with an update form for an individual brewery.
  # * I can change any information about the brewery. (name, description etc.)
  # * I will be redirected to the brewery's page and can view changes.
  let(:admin) { FactoryGirl.create(:user, role: "admin") }

  scenario 'admin successfully updates brewery information' do
    login_as admin
    brewery = FactoryGirl.create(:brewery)

    visit edit_admin_brewery_path(brewery)

    expect(page).to have_field "Name", with: brewery.name
    expect(page).to have_field "Address", with: brewery.address
    expect(page).to have_field "City", with: brewery.city
    expect(page).to have_field "State", with: brewery.state
    expect(page).to have_field "Zip", with: brewery.zip
    expect(page).to have_field "Hours", with: brewery.hours
    expect(page).to have_field "Phone Number", with: brewery.phone_number
    expect(page).to have_field "URL", with: brewery.url
    expect(page).to have_field "Description", with: brewery.description

    fill_in "Name", with: "Sammy Adams"

    click_button "Update Brewery"

    expect(page).to have_content "Brewery information updated"
    expect(page).to have_content "Sammy Adams"
    expect(page).to_not have_content brewery.name
  end

  scenario "admin tries to update brewery with invalid input" do
    login_as admin
    brewery = FactoryGirl.create(:brewery)

    visit edit_admin_brewery_path(brewery)

    fill_in "Name", with: ""

    click_button "Update Brewery"

    expect(page).to have_content "can't be blank"
  end

  scenario "admin tries to updates brewery with duplicate input" do
    login_as admin
    breweries = FactoryGirl.create_list(:brewery, 2)

    visit edit_admin_brewery_path(breweries[0])

    fill_in "Name", with: breweries[1].name

    click_button "Update Brewery"

    expect(page).to have_content "has already been taken"
    expect(page).to have_content breweries[1].name
  end
end
