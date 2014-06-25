require 'rails_helper'

feature 'user adds review', %Q{
  As a user, I want to write a review of a brewery,
  so that I can share my experience at the brewery.
} do

  # 4. As a user, I want to write a review of a brewery, so that I can share my experience at the brewery.
  #   a. I am in the brewery details page.
  #   b. The review description must be more that # characters?
  #   c. The review has a title.
  #   d. I can give a rating from num to num.

  let(:user) { FactoryGirl.create(:user) }
  let(:brewery) { FactoryGirl.create(:brewery) }

  scenario 'user correctly fills out form' do
    login_as user

    visit brewery_path(brewery)

    fill_in "Title", with: "Moe's"
    fill_in "Body", with: "shitty beer"
    choose "review_rating_2"
    click_on 'Submit'

    expect(page).to have_content "Moe's"
    expect(page).to have_content "shitty beer"
    expect(page).to have_content "Review successfully added"
  end

  scenario "user incorrectly fills out form" do
    login_as user

    visit brewery_path(brewery)
    click_on 'Submit'

    expect(page).to have_content "can't be blank"
    expect(page).to_not have_content "Review successfully added"
  end
end
