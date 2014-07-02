class Brewery < ActiveRecord::Base
  has_many :reviews
  belongs_to :user
  validates :name, presence: true
  validates :name, uniqueness: { scope: :city }
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true

  def self.search(q)
    where("name ilike ? OR city ilike ?", "%#{q}%", "%#{q}%")
  end

end
