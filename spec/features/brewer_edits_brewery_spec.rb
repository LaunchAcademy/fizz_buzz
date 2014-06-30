require 'rails_helper'

feature 'brewer edits their brewery', %Q{
  As a brewer I want the ability to
  edit my brewery in order to keep it up
  to date.
} do

  #I can navigate to a page with a form with my brewery's current information.
  #I can change and information about my brewery. (name, description etc.)
  #I will be redirected to my breweries page so I can view my changes.

  let(:user) { FactoryGirl.create(:user) }
  let(:brewery) { FactoryGirl.create(:brewery, user: user)}
  scenario 'brewer updates brewery with valid input' do
    login_as user

    visit edit_brewery_path(brewery)

    fill_in "Name", with: "Sammy Adams"

    click_button "Update"

    expect(page).to have_content "Brewery information updated"
    expect(page).to have_content "Sammy Adams"
    expect(page).to_not have_content brewery.name
  end

  scenario "brewer updates brewery information with invalid input" do
    login_as user

    visit edit_brewery_path(brewery)

    fill_in "Name", with: ""

    click_button "Update"

    expect(page).to have_content "can't be blank"
  end

  scenario 'user tries to update brewery' do
    user2 = FactoryGirl.create(:user)
    login_as user2

    visit edit_brewery_path(brewery)

    expect(page).to_not have_content 'Update'
  end
end
