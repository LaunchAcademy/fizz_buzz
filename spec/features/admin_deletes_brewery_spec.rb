require 'rails_helper'

feature "admin deletes brewery", %Q{
  As an admin, I want to be able to delete a brewery from the site,
  in case they close or violate our terms of service.
} do

  # An admin can delete a brewery
  # They will be redirected to the breweries index
  # Users cannot

  let(:admin) { FactoryGirl.create(:user, role: 'admin')}
  let(:user) { FactoryGirl.create(:user)}
  let(:brewery) { FactoryGirl.create(:brewery) }
  scenario "admin can delete brewery" do
    login_as admin

    visit admin_brewery_path(brewery)

    click_link "Delete brewery"

    expect(page).to have_content "Brewery successfully deleted"
    expect(page.current_path).to eq(admin_breweries_path)
  end

  scenario "user can't get to admin brewery page" do
    login_as user

    visit admin_brewery_path(brewery)

    expect(page).to have_content "The page you were looking for doesn't exist"
  end

  scenario "user has no option to delete on user brewery page" do
    login_as user

    visit brewery_path(brewery)

    expect(page).to_not have_content "Delete brewery"
  end
end