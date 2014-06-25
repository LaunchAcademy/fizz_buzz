class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :brewery
  validates :title, presence: true
  validates :body, presence: true
  validates :rating, presence: true
end
