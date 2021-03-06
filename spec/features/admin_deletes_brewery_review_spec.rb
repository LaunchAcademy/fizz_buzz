require 'rails_helper'

feature "admin can delete a review for a brewery", %q(
  As an administrator, 
  I want to be able to be able to edit offensive reviews, 
  so that the site remains friendly and informative.
) do
  # Acceptance Criteria:
  # I delete an offending review from the site
  # A regular user should not be able to delete a brewery
  let(:admin) { FactoryGirl.create(:user, role: "admin") }
  let(:user) { FactoryGirl.create(:user) }
  let(:brewery) { FactoryGirl.create(:brewery) }
  let!(:review) { FactoryGirl.create(:review, brewery: brewery) }

  scenario "admin deletes a review from a brewery" do
    login_as admin
    visit admin_brewery_path(brewery)
    click_link "Delete review"
    expect(current_path).to eq(admin_brewery_path(brewery))
  end

  scenario "user tries to delete review" do
    login_as user
    visit brewery_path(brewery)
    expect(page).to_not have_content("Delete review")
  end
end
