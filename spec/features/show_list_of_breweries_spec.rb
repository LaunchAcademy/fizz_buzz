require 'rails_helper'

feature 'show a list of breweries',  %q(
  As a user, I want to view a list of breweries,
  so I can find a brewery to visit.
  # I can navigate to a page with all the breweries listed.
  # Every brewery must have their name and city listed.
  # List is ordered by tbd
  # All breweries should link to their personal page.
) do
  scenario "user visits brewery index page" do
    breweries = FactoryGirl.create_list(:brewery, 3)

    visit '/breweries'

    breweries.each do |brewery|
      expect(page).to have_content(brewery.name)
      expect(page).to have_content(brewery.city)
      expect(page).to have_link(brewery.name, brewery_path(brewery))
    end

    expect(page).to have_css("li", :count => 6)
  end
end
