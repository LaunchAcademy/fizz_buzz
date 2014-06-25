require 'rails_helper'

feature "admin deletes brewery", %q(
  As an admin, I want to be able to delete a brewery from the site,
  in case they close or violate our terms of service.
  # I can delete a brewery
  # I will be redirected to the breweries index
) do

  scenario "admin can delete brewery" do
    brewery = FactoryGirl.create(:brewery)

    visit brewery_path(brewery)

    click_link "Delete brewery"

    expect(page).to have_content "Brewery successfully deleted"
    expect(page.current_path).to eq(breweries_path)
  end

end
