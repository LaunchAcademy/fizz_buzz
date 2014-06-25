require 'rails_helper'

feature 'user adds review', %Q{
  As a user, I want to write a review of a brewery,
  so that I can share my experience at the brewery.} do

# 4. As a user, I want to write a review of a brewery, so that I can share my experience at the brewery.
#   a. I am in the brewery details page.
#   b. The review description must be more that # characters?
#   c. The review has a title.
#   d. I can give a rating from num to num.
  scenario 'user correctly fills out form' do
    brewery = FactoryGirl.create(:brewery)
    user = FactoryGirl.create(:user)
    review = FactoryGirl.build(:review)

    login_as(user, scope: :user)

    visit brewery_path(brewery)

    # save_and_open_page
    fill_in "Title", with: review.title
    fill_in "Body", with: review.body

    choose "review_rating_2"
    click_on 'Submit'

    expect(page).to have_content review.title
    expect(page).to have_content review.body
    expect(page).to have_content "Review successfully added"
  end

  scenario "user incorrectly fills out form" do

    brewery = FactoryGirl.create(:brewery)
    user = FactoryGirl.create(:user)
    review = FactoryGirl.build(:review)

    login_as(user, scope: :user)
    visit root_path

    visit brewery_path(brewery)
    click_on 'Submit'
    expect(page).to have_content "can't be blank"
    expect(page).to_not have_content "Review successfully added"
    end
end
