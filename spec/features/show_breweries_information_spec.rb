require 'rails_helper'

feature 'show brewery information', %q(
  As a user, I want to view details about a specific brewery,
  so I can decide if I want to visit.
    # I can view all information about a brewery. (name, description, etc.)
    # I can navigate back to the breweies index page
    # I can navigate to a breweries company website.
) do

  # I can view all information about a brewery. (name, description, etc.)
  # I can navigate back to the breweies index page
  # I can navigate to a breweries company website.

    scenario "user visits a brewery's information page" do
      brewery = FactoryGirl.create(:brewery)

      visit brewery_path(brewery)

      expect(page).to have_content brewery.name
      expect(page).to have_content brewery.address
      expect(page).to have_content brewery.city
      expect(page).to have_content brewery.state
      expect(page).to have_content brewery.zip
      expect(page).to have_content brewery.hours
      expect(page).to have_content brewery.phone_number
      expect(page).to have_content brewery.url
      expect(page).to have_content brewery.description

      expect(page).to have_link "Back to breweries list", breweries_path
      expect(page).to have_link brewery.url, href: brewery.url
    end
  end
