require 'rails_helper'

feature 'admin edits a review', %Q{
  As a admin I want to ability to edit
  any user's reviews in order to
  edit unaproprate content
} do

  let(:review) { FactoryGirl.create(:review) }
  let(:admin) { FactoryGirl.create(:user, role: 'admin')}
  let(:user) { FactoryGirl.create(:user)}
  scenario 'admin correctly edits a review' do
    login_as admin

    visit admin_brewery_path(review.brewery)

    click_on "Edit review"
    choose "review_rating_5"
    fill_in 'Body', with: 'This is a test string'
    click_on 'Update'

    expect(page).to have_content 'This is a test string'
    expect(page).to have_content '5'
    expect(page).to have_content "Review successfully updated"
  end

  scenario 'User incorrectly edits review' do
    login_as admin

    visit admin_brewery_path(review.brewery)

    click_on "Edit review"

    fill_in 'Body', with: ''
    click_on 'Update'

    expect(page).to have_content "can't be blank"
    expect(page).to_not have_content "Review successfully updated"
  end

  scenario 'User can not edit a review that the user didnt create' do
    login_as user

    expect{visit admin_brewery_path(review.brewery)}.to raise_error(ActionController::RoutingError)
  end

  scenario 'User can not edit a review that the user didnt create' do
    login_as user

    visit brewery_path(review.brewery)

    expect(page).to_not have_content "Edit review"
  end
end
