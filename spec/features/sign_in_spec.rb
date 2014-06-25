require 'rails_helper'

feature 'user signs in', %Q{As a site visitor
I want to be able to visit the site
So that I can sign in} do

  # Acceptance Criteria:
  # I can navigate to a sign in page.
  # I can sign into my account.
  # I can sign out of my account.

  scenario 'user signs into an account' do

    login_as(FactoryGirl.create(:user), scope: :user)
    visit root_path

    expect(page).to have_content "Logout"
  end

  scenario "user enters incorrect password" do

    user = FactoryGirl.create(:user)
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: "notpassword"

    click_on 'Sign in'

    expect(page).to have_content "Invalid email or password."
  end

  scenario "user enters blank password" do

    user = FactoryGirl.create(:user)
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: ""

    click_on 'Sign in'

    expect(page).to have_content "Invalid email or password."
  end

  scenario 'user already logged in' do

    login_as(FactoryGirl.create(:user), scope: :user)
    visit new_user_session_path

    expect(page).to have_content "You are already signed in."
  end

  scenario 'user signs out of account' do

    login_as(FactoryGirl.create(:user), scope: :user)
    visit root_path

    click_on 'Logout'

    expect(page).to have_content "Signed out successfully."
  end
end
