require 'rails_helper'

feature "search on root page", %q(
  As a user, I want to search for a brewery, so that I can write a review.
) do

  # Acceptance Criteria:
  # I can enter search criteria into a search field that is matched to name
  # After the search I am presented with the breweries that match my search
  # I am given an message if the search returned no results.
  
  scenario "enters a valid brewery into search field" do
    brewery = FactoryGirl.create(:brewery)

    visit '/'
    
    fill_in "Search", with: brewery.name
    
    click_button "Search"

    expect(page).to have_content brewery.name
  end

  scenario "enters an invalid brewery into search field" do
    brewery = FactoryGirl.create(:brewery)

    visit '/'
    
    fill_in "Search", with: brewery.name + "FooBizz"
    
    click_button "Search"

    expect(page).to_not have_content brewery.name
    expect(page).to have_content "Your search returned no results."
  end
end
