class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

  validates :user, uniqueness: { scope: :review }
end
