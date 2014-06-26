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
    review = FactoryGirl.build(:review)
    review.brewery_id = brewery.id
    review.user_id = user.id
    review.save
    visit brewery_path(brewery)

    click_on 'Delete'

    expect(page).to have_content "Review successfully deleted"
    expect(page).to_not have_content review.title
    expect(page).to_not have_content review.body
  end

end
