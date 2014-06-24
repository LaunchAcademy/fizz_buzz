require 'rails_helper'
require 'pry'

feature 'user creates a new account', %Q{
As a site visitor
I want to be able to visit the site
So that I can create a new account
} do

# Acceptance Criteria:
# * I can navigate to a login page
# * I can sign up for a new account.

  scenario 'user creates a new account' do

    user = FactoryGirl.create(:user)

    visit new_user_registration_path

    fill_in 'First Name', with: user.first_name
    fill_in 'Last Name', with: user.last_name
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password Confirmation', with: user.password_confirmation

    click_on 'Sign Up'

    expect(page).to have_content "Welcome"   #### revisit ####
    expect(page).to_not have_content "can't be blank"

  end

  scenario 'without requirements' do
    pending

    visit new_user_registration_path
    click_on 'Sign Up'

    expect(page).to have_content "can't be blank"

  end

  scenario 'account already exists' do
    pending

    user = FactoryGirl.create(:user)

    visit new_user_registration_path
    fill_in 'Email', with: user.email

    click_on 'Sign up'

    expect(page).to_not have_content "Sign Out"
    expect(page).to have_content "already exists"   ### revisit ####

  end
end

