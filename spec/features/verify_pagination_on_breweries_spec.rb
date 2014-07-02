require 'rails_helper'

feature "pagination on breweries index", %Q{
  As a user
  I want to view a paginated list of breweries
  So that a pleasing amount is displayed on one page
} do

  # Acceptance Criteria:
  # I can view a large list of breweries separated into pages
  # There are 15 breweries per page.

  scenario "views breweries listed with pagination" do

    breweries = FactoryGirl.create_list(:brewery, 30)

    visit breweries_path

    within("#breweries-list") do
      expect(page).to have_css("td", :count => 30)
    end

    expect(page).to have_content("Next ›")
  end
end
