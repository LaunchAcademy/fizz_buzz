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

  scenario "user 'Up' a review" do
    vote_count = review.up_vote_count

    visit brewery_path(review.brewery)
    click_on 'Up'
    within('.up-vote') do
      expect(page).to have_content '1'
      expect(review.up_vote_count).to eq vote_count + 1
    end
  end

  scenario "user 'Down' a review" do
    vote_count = review.down_vote_count

    visit brewery_path(review.brewery)
    click_on 'Down'
    within('.down-vote') do
      expect(page).to have_content '-1'
      expect(review.down_vote_count).to eq vote_count - 1
    end
  end

  scenario "user 'Up' a review" do
    vote_count = review.up_vote_count

    visit brewery_path(review.brewery)
    click_on 'Up'

    within('.up-vote') do
      expect(page).to have_content '1'
      expect(review.up_vote_count).to eq vote_count + 1
    end

    click_on 'Down'

    within('.down-vote') do
      expect(page).to have_content '-1'
      expect(review.down_vote_count).to eq vote_count - 1
    end
  end
end
