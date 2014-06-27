require 'rails_helper'

RSpec.describe Review, :type => :model do
  it { should belong_to :user }
  it { should belong_to :brewery }
  it { should have_many :votes }

  it { should have_valid(:title).when('awesome brewery', 'kinda average') }
  it { should_not have_valid(:title).when(nil, '') }

  it { should have_valid(:body).when('awesome brewery', 'kinda average') }
  it { should_not have_valid(:body).when(nil, '') }

  it { should have_valid(:rating).when(1, 2, 3, 4, 5) }
  it { should_not have_valid(:rating).when(nil, '', -5, 7) }

  describe 'up_vote_count' do
    it 'sums the positive votes' do
      review = FactoryGirl.create(:review)
      5.times { FactoryGirl.create(:vote, review: review, score: 1) }
      expect(review.up_vote_count).to eq 5
    end
  end

  describe 'down_vote_count' do
    it 'sums the positive votes' do
      review = FactoryGirl.create(:review)
      5.times { FactoryGirl.create(:vote, review: review, score: -1) }
      expect(review.down_vote_count).to eq -5
    end
  end

  describe 'total_vote_count' do
    it 'sum of all counts' do
      review = FactoryGirl.create(:review)
      3.times { FactoryGirl.create(:vote, review: review, score: -1) }
      3.times { FactoryGirl.create(:vote, review: review, score: 1) }
      expect(review.total_vote_count).to eq 0
    end
  end
end
