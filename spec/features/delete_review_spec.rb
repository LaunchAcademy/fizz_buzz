require "rails_helper"

feature 'User deletes a review', %Q{
  As a user I want to be able to delete my reviews,
  so that if I change my opinion of the brewery I can write
  new review.
} do

  # I am in the brewery details page.
  #
  let(:user) { FactoryGirl.create(:user) }
  let(:brewery) { FactoryGirl.create(:brewery) }

  scenario 'User deletes a review' do
    login_as user
    review = FactoryGirl.create(:review, user: user, brewery: brewery)

    visit brewery_path(brewery)

    click_on 'Delete review'

    expect(page).to have_content "Review successfully deleted"
    expect(page).to_not have_content review.title
    expect(page).to_not have_content review.body
  end

  scenario 'User can not delete a review that the user didnt create' do
    user_2 = FactoryGirl.create(:user)
    review = FactoryGirl.create(:review, user: user, brewery: brewery)

    login_as user_2
    visit brewery_path(brewery)

    expect(page).to_not have_content 'Delete review'
  end
end
