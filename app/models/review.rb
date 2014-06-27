class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :brewery
  has_many :votes

  validates :title, presence: true
  validates :body, presence: true
  validates :rating, presence: true


  def up_vote_count
    total = 0
    self.votes.each do |vote|
      if vote.score == 1
        total += 1
      end
    end
    total


  end

  def down_vote_count
    total = 0
    self.votes.each do |vote|
      if vote.score == -1
        total -= 1
      end
    end
    total
  end
end
