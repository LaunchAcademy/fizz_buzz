require 'rails_helper'

feature 'adds votes', %Q{
  As a user, I want to be able to up vote or down vote a review,
  in order to identify quality reviews.
} do

  # a. I am in the brewery detail page.
  # b. I can click one of two buttons (up/down)
  # c. I can see the results of clicking the buttons after doing so.

  let(:user) { FactoryGirl.create(:user) }
  let(:brewery) { FactoryGirl.create(:brewery) }
  let(:review) { FactoryGirl.create(:review, brewery: brewery) }

  before :each do
    login_as user
  end

  scenario "user 'Like' a review" do
    vote_count = review.up_vote_count

    visit brewery_path(review.brewery)

    click_on 'Like'
    expect(review.up_vote_count).to eq vote_count + 1
  end

  scenario "user 'Unlike' a review" do
    vote_count = review.down_vote_count

    visit brewery_path(review.brewery)

    click_on 'Unlike'
    expect(review.down_vote_count).to eq vote_count - 1
  end

  scenario "user 'Like0' a review" do
    vote_count = review.up_vote_count

    visit brewery_path(review.brewery)

    click_on 'Like'
    expect(review.up_vote_count).to eq vote_count + 1

    click_on 'Unlike'
    expect(review.down_vote_count).to eq vote_count - 1
  end
end
