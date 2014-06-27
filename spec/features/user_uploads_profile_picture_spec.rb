require 'rails_helper'

feature 'user uploads a profile picture', %q(
  As a user, I want to be able to upload a profile photo,
  so that people can see my pretty face.
) do 
  # Acceptance Criteria
  # I want to be able to upload a photo from the registration page
  # I want to be able to change my photo from my profile edit page

  scenario "user uploads a photo on registration page" do
    visit new_user_registration_path

    fill_in 'First Name', with: "John"
    fill_in 'Last Name', with: "Johnny"
    fill_in 'Email', with: "jk@jk.com"
    fill_in 'Password', with: "TestPass123"
    fill_in 'Password Confirmation', with: "TestPass123"

    attach_file 'user_profile_photo', File.join(Rails.root, "/spec/images/test_profile.png")

    click_on 'Sign Up'
    
    expect(page).to have_content "Welcome! You have signed up successfully."
    
    visit edit_user_registration_path

    user = User.find_by(first_name: "John")

    expect(page).to have_css("img[src='/uploads/user/profile_photo/#{user.id}/test_profile.png']")
  end

  scenario "user uploads invalid file format" do
    visit new_user_registration_path

    fill_in 'First Name', with: "John"
    fill_in 'Last Name', with: "Johnny"
    fill_in 'Email', with: "jk@jk.com"
    fill_in 'Password', with: "TestPass123"
    fill_in 'Password Confirmation', with: "TestPass123"

    attach_file 'user_profile_photo', File.join(Rails.root, "/spec/images/test_profile.XNG")

    click_on 'Sign Up'
    
    expect(page).to have_content "You are not allowed to upload"
  end

  scenario "user updates photo on profile page" do
    visit new_user_registration_path

    user_password = "TestPass123"

    fill_in 'First Name', with: "John"
    fill_in 'Last Name', with: "Johnny"
    fill_in 'Email', with: "jk@jk.com"
    fill_in 'Password', with: "TestPass123"
    fill_in 'Password Confirmation', with: "TestPass123"

    click_on 'Sign Up'
    
    expect(page).to have_content "Welcome! You have signed up successfully."


    visit edit_user_registration_path

    fill_in 'Current password', with: user_password

    attach_file 'user_profile_photo', File.join(Rails.root, "/spec/images/test_profile.png")
    
    click_on 'Update'
    
    visit edit_user_registration_path

    expect(page).to_not have_content "You are not allowed to upload"
    expect(page).to have_css("img[src='/uploads/user/profile_photo/#{User.last.id}/test_profile.png']")

  end
end
