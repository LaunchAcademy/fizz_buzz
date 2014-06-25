
require 'rails_helper'

feature "As a user, I want to view a list of breweries, so I can find a brewery to visit" do
  # a. I can navigate to a page with all the breweries listed.
  # b. Every brewery must have their name and city listed.
  # c. List is ordered by tbd
  # d. All breweries should link to their personal page.

  scenario "user visits brewery index page" do
    breweries = FactoryGirl.create_list(:breweries, 3)

    visit '/breweries'

    breweries.each do |brewery|
      expect(page).to have_content(brewery.name)
      expect(page).to have_content(brewery.city)
      expect(page).to have_link(brewery_path(brewery.name, brewery))
    end

    expect(page).to have_css("li", :count => 3)
  end
end
