require 'rails_helper'

feature 'update brewery information', %q(
   As a brewery, I want to be able to update information about my brewery,
   so that people can have current info about us.
   #I can navigate to a page with a form with my brewery's current information.
   #I can change and information about my brewery. (name, description etc.)
   #I will be redirected to my breweries page so I can view my changes.
   ) do

  scenario "brewer visits a page with form containing current brewery information" do
    brewery = FactoryGirl.create(:brewery)

    visit edit_brewery_path(brewery)

    expect(page).to have_field "Name", with: brewery.name
    expect(page).to have_field "Address", with: brewery.address
    expect(page).to have_field "City", with: brewery.city
    expect(page).to have_field "State", with: brewery.state
    expect(page).to have_field "Zip", with: brewery.zip
    expect(page).to have_field "Hours", with: brewery.hours
    expect(page).to have_field "Phone Number", with: brewery.phone_number
    expect(page).to have_field "URL", with: brewery.url
    expect(page).to have_field "Description", with: brewery.description
  end

  scenario "brewer updates brewery information with valid input" do
    brewery = FactoryGirl.create(:brewery)

    visit edit_brewery_path(brewery)

    fill_in "Name", with: "Sammy Adams"

    click_button "Update"

    expect(page).to have_content "Brewery information updated"
    expect(page).to have_content "Sammy Adams"
    expect(page).to_not have_content brewery.name
  end

  scenario "brewer updates brewery information with invalid input" do
    brewery = FactoryGirl.create(:brewery)

    visit edit_brewery_path(brewery)

    fill_in "Name", with: ""

    click_button "Update"

    expect(page).to have_content "can't be blank"
  end

  scenario "brewer updates brewery information with repeated information" do
    breweries = FactoryGirl.create_list(:brewery, 2)

    visit edit_brewery_path(breweries[0])

    fill_in "Name", with: breweries[1].name

    click_button "Update"

    expect(page).to have_content "has already been taken"
    expect(page).to have_content breweries[1].name
  end

end
