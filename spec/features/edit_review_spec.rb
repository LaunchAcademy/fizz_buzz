require 'rails_helper'

feature 'user edits review', %Q{As a user, I want to be able to edit my reviews.
  } do
  # Acceptance Criteria:
  #   a. I am in the user profile page.
  #   b. I can only edit reviews that I submitted
  #   c. After editing I can see the review in the list of reviews, the reviews are still in the same order


  let(:user) { FactoryGirl.create(:user) }
  let(:brewery) { FactoryGirl.create(:brewery) }
  # let(:review) { FactoryGirl.create(:review) } why is this not working?

  scenario 'User correctly edits review' do
    login_as user
    review = FactoryGirl.build(:review)
    review.brewery_id = brewery.id
    review.user_id = user.id
    review.save
    visit brewery_path(brewery)

    click_on "Edit"
    save_and_open_page
    choose "review_rating_5"
    fill_in 'Body', with: 'This is a test string'
    click_on 'Update'

    expect(page).to have_content 'This is a test string'
    expect(page).to have_content '5'
    expect(page).to have_content "Review successfully updated"

  end

  scenario 'User incorrectly edits review' do
    login_as user
    review = FactoryGirl.build(:review)
    review.brewery_id = brewery.id
    review.user_id = user.id
    review.save
    visit brewery_path(brewery)

    click_on "Edit"

    fill_in 'Body', with: ''
    click_on 'Update'

    expect(page).to have_content "can't be blank"
    expect(page).to_not have_content "Review successfully updated"


  end

end
