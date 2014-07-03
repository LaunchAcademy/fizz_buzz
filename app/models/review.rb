class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :brewery
  has_many :votes

  validates :title, presence: true
  validates :body, presence: true
  validates :rating, numericality: { greater_than: 0, less_than: 6 }

  def up_vote_count
   votes.where(score: 1).sum(:score)
  end

  def down_vote_count
    votes.where(score: -1).sum(:score)
  end

  def total_vote_count
    up_vote_count + down_vote_count
  end

  def update_rank
    self.update(rank: self.total_vote_count)
  end
end
