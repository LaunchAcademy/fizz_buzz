require 'rails_helper'

feature 'user signs in', %Q{As a site visitor
I want to be able to visit the site
So that I can sign in} do
  # Acceptance Criteria:
  # I can navigate to a sign in page.
  # I can sign into my account.
  # I can sign out of my account.

  scenario 'user signs into an account' do

    visit new_user_session_path

    user = FactoryGirl.create(:user)

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_on 'Sign in'
    expect(page).to have_content "Signed in successfully."

  end

  scenario "user enters incorrect credentials" do
    passwords = ['', 'apple']
    user = FactoryGirl.create(:user)
    visit new_user_session_path

    passwords.each do |i|

      fill_in 'Email', with: user.email
      fill_in 'Password', with: "#{i}"

      click_on 'Sign in'
      expect(page).to have_content "Invalid email or password."
    end
  end

  scenario 'user already logged in' do

    user = FactoryGirl.create(:user)
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_on 'Sign in'

    visit new_user_session_path

    expect(page).to have_content "You are already signed in."
  end
end
