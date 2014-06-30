require 'rails_helper'

feature 'admin views breweries', %Q(
  As an admin user I want  to view the list of brewerys
  so that I can maintain the site.
    # When I am authorized as an admin I can log in as an admin and view breweries.
    # When I am NOT authorized as an admin I can NOT log in as an admin and view breweries.

  ) do
  let!(:brewery) { FactoryGirl.create(:brewery) }
  
  scenario 'admin logs in as admin' do
    login_as(FactoryGirl.create(:user, role: "admin"))
    visit admin_breweries_path
    
    expect(page).to have_content(brewery.name)
  end

  scenario 'user logs in as admin' do
    login_as(FactoryGirl.create(:user))
    visit admin_breweries_path

    expect(page).to have_content "The page you were looking for doesn't exist"
  end
end
